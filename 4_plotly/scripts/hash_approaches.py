import plotly.plotly as py
import plotly.graph_objs as go

trace1 = go.Bar(
            text=dict(family='Courier New, monospace',size=14,color='#000000'),
            x=['Bare metal',
                '1 Docker<br>container per<br> host using<br>host network<br>',
                '1 Docker<br>container per<br> host using<br>overlay network<br>',
		'Singularity<br>container<br>'
            ],
            y=[4217800.9,	4216212.52,	4229014.42,	4244645.8
	    ]
              )
data = [trace1]

layout = go.Layout(
	    margin = dict(l = 100, r = 0, b = 150, t = -100),
	    bargap=0.5,
            barmode='group',
            title="KMI Hash - MPI Execution Approaches",
 	    titlefont=dict(family='Courier New, monospace',size=25,color='#000000'),
            
            xaxis=dict( 
                title='Execution Methods',
		titlefont=dict(family='Courier New, monospace',size=25,color='#000000'),
		tickfont=dict(family='Courier New, monospace',size=16,color='#000000')
                ),
            yaxis=dict(
                title='Queries per Second',
		titlefont=dict(family='Courier New, monospace',size=25,color='#000000'),
		tickfont=dict(family='Courier New, monospace',size=16,color='#000000'),
		range=[3000000,4250000]
                )
            
            )



fig = go.Figure(data=data, layout=layout)
py.image.save_as(fig, filename="hash_approaches.pdf") 

