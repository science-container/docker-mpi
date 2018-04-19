import plotly.plotly as py
import plotly.graph_objs as go

trace1 = go.Bar(
            text=dict(family='Courier New, monospace',size=14,color='#000000'),
	    marker=dict(color=['#d62728','#d62728','#d62728','#d62728','#d62728']),
            x=['1 Rank','2 Ranks','4 Ranks','6 Ranks','12 Ranks'
            ],
            y=[33.23424,64.12878,63.18494,63.60708,63.82168
	    ]
              )
data = [trace1]

layout = go.Layout(
	    margin = dict(l = 100, r = 0, b = 150, t = -100),
	    bargap=0.5,
            barmode='group',
            title="HPCG - MPI Ranks per Container",
 	    titlefont=dict(family='Courier New, monospace',size=25,color='#000000'),
            
            xaxis=dict( 
                title='Ranks per Container',
		titlefont=dict(family='Courier New, monospace',size=25,color='#000000'),
		tickfont=dict(family='Courier New, monospace',size=16,color='#000000')
                ),
            yaxis=dict(
                title='Giga FLOPS',
		titlefont=dict(family='Courier New, monospace',size=25,color='#000000'),
		tickfont=dict(family='Courier New, monospace',size=16,color='#000000'),
		range=[20,70]
                )           
            )



fig = go.Figure(data=data, layout=layout)
py.image.save_as(fig, filename="hpcg_ranks_per_container.pdf") 

