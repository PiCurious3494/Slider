<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Slider.aspx.cs" Inherits="Slider" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Thank you for your opinions</title>
<meta name="viewport" content="width=device-width, initial-scale=1" charset="utf-8"/>
<script src="js/jquery-3.2.1.js"></script>
<script src="js/nouislider.js"></script>
<script src="js/wNumb.js"></script>
<script src="/jquery/dist/jquery.validate.js"></script>
<link rel="stylesheet" href="js/nouislider.css" type="text/css"/>

    <style>
    
.noUi-tooltip {
    display: none;
    position: relative;
	/*background: #00aabb;*/
    border: 1px solid #454445;
	border-radius: 25px;
    width: 30px;
    height: 30px;
     margin-top: -40px;
     text-align: center;
     padding: 6px;
     outline:none;
     margin-left: -6px;
    /*border-radius: 50% 50% 0;
    border-color: transparent;
    transition: border .4s ease;
     background-color: #25daa5;
     -webkit-transform: rotateZ(45deg);
    transform: rotateZ(45deg);
    margin-left: 1px;
     text-align: center;
     margin-top: -30px;*/ 
}


.noUi-tooltip:after{
	content: '';
	position: absolute;
	bottom: 0;
	left: 50%;
	width: 0;
	height: 0;
	border: 8px solid transparent;
	border-top-color: #454445;
	border-bottom: 0;
	margin-left: -8px;
	margin-bottom: -9px;
    outline:none;
}

.noUi-handle:hover .noUi-tooltip { 
    display:block; 
    outline:none;
}
.noUi-handle {
    outline:none;
}

.container {
    margin-left: 10px; 
    margin-right: 30px; 
}

.c-1-color { background: #009494; }
.c-2-color { background: #F5F2DC; }
.c-3-color { background: #454445; }
.c-4-color { background: #FF5729; }
#slider1   { border-color: #009494;
             border-style: solid;
             text-align: center;
}
#slider2   { border-color: #F5F2DC;
             border-style: solid;
             text-align: center;
}
#slider3   { border-color: #454445;
             border-style: solid;
             text-align: center;
}
#slider4   { border-color: #FF5729;
             border-style: solid;
             text-align: center;
}


    </style>

<script>

    $(document).ready(function () {
  
        var slider = document.getElementById("slider");
        var nvalA = 0;
        var nvalB = 0;
        var nvalC = 0;
        var nvalD = 0;
      
        noUiSlider.create(slider, {
            start: [25, 50, 75, 100],
            
            tooltips: true,
            connect: [true, true, true, true, false],
            range: {
                'min': [0],
                'max': [ 100 ]
            },
            format: wNumb({
                decimals: 0,         
            })
           
        });

        var connect = slider.querySelectorAll('.noUi-connect');
        var classes = ['c-1-color', 'c-2-color', 'c-3-color', 'c-4-color'];

        for (var i = 0; i < connect.length; i++) {
            connect[i].classList.add(classes[i]);

        }
     
 

       
        // To disable one handle
        
        var origins = slider.getElementsByClassName('noUi-origin');
        origins[3].setAttribute('disabled', true);

        var sliderA = document.getElementById("slider1");      
        var sliderB = document.getElementById("slider2");
        var sliderC = document.getElementById("slider3");
        var sliderD = document.getElementById("slider4");
   
 

        slider.noUiSlider.on('update', function (values, handle) {

           

           var A = values[0];
           var B = values[1];
           var C = values[2];
           var D = values[3];

            sliderA.value = A;
            sliderB.value = B - A;
            sliderC.value = C - B;
            sliderD.value = D - C;

            nvalA = parseInt(sliderA.value);
            nvalB = parseInt(sliderB.value);
            nvalC = parseInt(sliderC.value);
            nvalD = parseInt(sliderD.value);

            $(".noUi-tooltip:first").html(nvalA);
            $(".noUi-tooltip:eq(1)").html(nvalB);
            $(".noUi-tooltip:eq(2)").html(nvalC);
            $(".noUi-tooltip:last").html(nvalD);
         
        });

        $(function () {
            $(".noUi-tooltip:first").html(nvalA);
            $(".noUi-tooltip:eq(1)").html(nvalB);
            $(".noUi-tooltip:eq(2)").html(nvalB);
            $(".noUi-tooltip:last").html(nvalD);
            
        });


    });

$.validator.messages.required = 'Please select three items.';

</script>

</head>
<body>
  
     <form id="form1" class="cmgform" runat="server">
       <div class="surveyFrame">
    
                        <p class="centered">&nbsp;</p>
                        <p class="centered">What mix of the following would you like to hear on News 95.5 and AM750 WSB weekday mornings between 9 a.m. and 10 a.m. </p>
                           <p class="centered">&nbsp;</p>
                           <asp:label runat="server" Text="Politics "><asp:TextBox runat="server"  Columns="1" ID ="slider1" name="slider1"></asp:TextBox>&nbsp;%</asp:label>
                           <asp:label runat="server" Text="News/Weather/Taffic "><asp:TextBox runat="server" Columns="1" ID ="slider2" name="slider2"></asp:TextBox>&nbsp;%</asp:label>
                           <asp:label runat="server" Text="Caller Interaction "><asp:TextBox runat="server" Columns="1" ID ="slider3" name="slider3"></asp:TextBox>&nbsp;%</asp:label>
                           <asp:label runat="server" Text="Personal Stories "><asp:TextBox runat="server" Columns="1" ID ="slider4" name="slider4"></asp:TextBox>&nbsp;%</asp:label>
                           <p class="centered">&nbsp;</p>
           <div class="container">
                           <div id="slider"></div>

           </div>
             
                  <%--  <p>This text box will not be displayed live.  It is shown to demonstrate validation. </p>--%>
          
                        <%--<p class="centered"><label for="q18a" class="error"></label></p>
                        <p class="centered"><label for="valid18" class="error"></label></p>
                        <asp:TextBox runat="server" ID ="q18a" name="q18a" OnTextChanged="q18a_TextChanged"></asp:TextBox>   
                        <asp:TextBox runat="server" ID="valid" style="display:none;" AutoPostBack="true" OnTextChanged="valid_TextChanged"></asp:TextBox>         --%>                               
                  <%--      <p class="centered">&nbsp;</p>
                        <p><asp:Button ID="Back" runat="server" Text="Back to Demo Page" OnClick="Back_Click" /></p>--%>
                        <p class="centered">&nbsp;</p>
					

    </div>
    </form>
</body>
</html>
