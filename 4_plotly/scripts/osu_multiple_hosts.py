import plotly.plotly as py
import plotly.graph_objs as go

trace1 = go.Bar(
            text=dict(family='Courier New, monospace',size=14,color='#000000'),
	    marker=dict(color=['#00ff00','#00ff00','#00ff00','#00ff00','#00ff00']),
            x=['2 host <br>nodes','3 host<br> nodes','4 host<br> nodes','5 host<br> nodes','6 host<br> nodes'	
            ],
            y=[9059.83,	6146.93,	4637.36,	4137.46,	3315.8
	    ]
              )
data = [trace1]

layout = go.Layout(
	    margin = dict(l = 100, r = 0, b = 150, t = -100),
	    bargap=0.5,
            barmode='group',
            title="OSU - Variable Number of Nodes",
 	    titlefont=dict(family='Courier New, monospace',size=25,color='#000000'),
            
            xaxis=dict( 
                title='Number of Hosts',
		titlefont=dict(family='Courier New, monospace',size=25,color='#000000'),
		tickfont=dict(family='Courier New, monospace',size=16,color='#000000')
                ),
            yaxis=dict(
                title="Latency ("+u'\u03bc'+"s)",
		titlefont=dict(family='Courier New, monospace',size=25,color='#000000'),
		tickfont=dict(family='Courier New, monospace',size=16,color='#000000'),
		range=[0,10000]
                )           
            )



fig = go.Figure(data=data, layout=layout)
py.image.save_as(fig, filename="osu_multiple_hosts.pdf") 

