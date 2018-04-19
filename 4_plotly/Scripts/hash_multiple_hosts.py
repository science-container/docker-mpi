import plotly.plotly as py
import plotly.graph_objs as go

trace1 = go.Bar(
            text=dict(family='Courier New, monospace',size=14,color='#000000'),
	    marker=dict(color=['#00ff00','#00ff00','#00ff00','#00ff00','#00ff00']),
            x=['2 host <br>nodes','3 host<br> nodes','4 host<br> nodes','5 host<br> nodes','6 host<br> nodes'	
            ],
            y=[1633105.1,
		2314715.6,
		2757781.8,
		3004790.1,
		3181246
	    ]
              )
data = [trace1]

layout = go.Layout(
	    margin = dict(l = 100, r = 0, b = 150, t = -100),
	    bargap=0.5,
            barmode='group',
            title="KMI Hash - Variable Number of Nodes",
 	    titlefont=dict(family='Courier New, monospace',size=25,color='#000000'),
            
            xaxis=dict( 
                title='Number of Hosts',
		titlefont=dict(family='Courier New, monospace',size=25,color='#000000'),
		tickfont=dict(family='Courier New, monospace',size=16,color='#000000')
                ),
            yaxis=dict(
                title='Queries per Second',
		titlefont=dict(family='Courier New, monospace',size=25,color='#000000'),
		tickfont=dict(family='Courier New, monospace',size=16,color='#000000'),
		range=[1000000,3500000]
                )           
            )



fig = go.Figure(data=data, layout=layout)
py.image.save_as(fig, filename="hash_multiple_hosts.pdf") 

