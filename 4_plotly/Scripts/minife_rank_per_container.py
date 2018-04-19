import plotly.plotly as py
import plotly.graph_objs as go

trace1 = go.Bar(
            text=dict(family='Courier New, monospace',size=14,color='#000000'),
	    marker=dict(color=['#d62728','#d62728','#d62728','#d62728','#d62728']),
            x=['1 Rank','2 Ranks','4 Ranks','8 Ranks','16 Ranks'
            ],
            y=[46874.38,92841.56,93266.92,93623.4,94569.6
	    ]
              )
data = [trace1]

layout = go.Layout(
	    margin = dict(l = 100, r = 0, b = 150, t = -100),
	    bargap=0.5,
            barmode='group',
            title="MiniFE - MPI Ranks per Container",
 	    titlefont=dict(family='Courier New, monospace',size=25,color='#000000'),
            
            xaxis=dict( 
                title='Ranks per Container',
		titlefont=dict(family='Courier New, monospace',size=25,color='#000000'),
		tickfont=dict(family='Courier New, monospace',size=16,color='#000000')
                ),
            yaxis=dict(
                title='Mega FLOPS',
		titlefont=dict(family='Courier New, monospace',size=25,color='#000000'),
		tickfont=dict(family='Courier New, monospace',size=16,color='#000000'),
		range=[20000,95000]
                )           
            )



fig = go.Figure(data=data, layout=layout)
py.image.save_as(fig, filename="minife_ranks_per_container.pdf") 

