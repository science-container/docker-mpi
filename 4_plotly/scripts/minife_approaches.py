import plotly.plotly as py
import plotly.graph_objs as go

trace1 = go.Bar(
            text=dict(family='Courier New, monospace',size=14,color='#000000'),
            x=['Bare metal',
                '1 Docker<br>container per<br> host using<br>host network<br>',
                '1 Docker<br>container per<br> host using<br>overlay network<br>',
		'Singularity<br>container<br>'
            ],
            y=[94420.98,94077.64,94569.6,93209.9
	    ]
              )
data = [trace1]

layout = go.Layout(
	    margin = dict(l = 100, r = 0, b = 150, t = -100),
	    bargap=0.5,
            barmode='group',
            title="MiniFE - MPI Execution Approaches",
 	    titlefont=dict(family='Courier New, monospace',size=25,color='#000000'),
            
            xaxis=dict( 
                title='Execution Methods',
		titlefont=dict(family='Courier New, monospace',size=25,color='#000000'),
		tickfont=dict(family='Courier New, monospace',size=16,color='#000000')
                ),
            yaxis=dict(
                title='Mega FLOPS',
		titlefont=dict(family='Courier New, monospace',size=25,color='#000000'),
		tickfont=dict(family='Courier New, monospace',size=16,color='#000000'),
		range=[80000,95000]
                )
            
            )



fig = go.Figure(data=data, layout=layout)
py.image.save_as(fig, filename="minife_approaches.pdf") 

