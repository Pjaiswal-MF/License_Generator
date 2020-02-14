<html>
<head>
    <title>Apple License Issuer</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans&display=swap" rel="stylesheet">


    <style>
        body {
            font-family: 'Open Sans', sans-serif;
            background-color: aliceblue;
        }
    </style>



    <SCRIPT>
        function datacheck()
        {

            var serialId = document.getElementById("serailId").value;
            var appId = document.getElementById("inputGroupSelect01").value;

            if(serialId.toString() !== null){
                if(appId.toString() !== "Choose..."){
                    return true;
                }
            }
            return false;
        }
    </SCRIPT>
</head>
<body>

<!-- Image and text -->
<nav class="navbar navbar-dark bg-dark">
    <a class="navbar-brand" href="#">
        <img src="https://upload.wikimedia.org/wikipedia/commons/3/31/Apple_logo_white.svg" width="30" height="30"
             class="d-inline-block align-top" alt="">
        Apple App License Issuer
    </a>
</nav>

<div class="pt-4 container">


    <form id="form" method="post" onsubmit="return datacheck()">
        <div class="form-group">
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="inputGroup-sizing-default">Serial Number</span>
                </div>
                <input id="serailId" type="text" name="serialId" class="form-control" aria-label="Default"
                       aria-describedby="inputGroup-sizing-default">
            </div>

            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <label class="input-group-text" for="inputGroupSelect01">App ID</label>
                </div>
                <select name="appId" class="custom-select" id="inputGroupSelect01">
                    <option selected>Choose...</option>
                    <option value="284882215">284882215</option>
                    <option value="297606951">297606951</option>
                    <option value="310633997">310633997</option>
                    <option value="332184886">332184886</option>
                    <option value="543186831">543186831</option>
                    <option value="1094591345">1094591345</option>
                </select>
            </div>

            <div class="pt-4 row align-content-around">

                <div class="col-4">
                    <button type="submit" formaction="./api?job=get" class="btn btn-primary btn-lg">Associate</button>
                </div>
                <div class="col-4">
                    <button type="submit" formaction="./api?job=del" class="btn btn-secondary btn-lg">Dis-Associate</button>
                </div>
                <div class="col-4">
                    <button type="submit" formaction="./api?job=chk" class="btn btn-warning btn-lg">Test Association</button>
                </div>


            </div>
        </div>
    </form>

    <div class="alert alert-danger" role="alert" id="success">
        This is a danger alert—check it out!
    </div>

    <div class="alert alert-success" role="alert" id="failure">
        This is a success alert—check it out!
    </div>

</div>

<script>
    const successdiv = document.getElementById("success");
    const failurediv = document.getElementById("failure");

    let status = "<%=request.getParameter("status")%>";
    let message = "<%=request.getParameter("message")%>";

    //alert(status.isEmpty());

    if(status.length === 4){
        successdiv.style.display = "none";
        failurediv.style.display = "none";
    }
    else {
        if (status.toString().localeCompare("success")) {
            successdiv.style.display = "block";
            failurediv.style.display = "none";

            successdiv.innerHTML = message;
        } else if (status.toString().localeCompare("failure")) {
            successdiv.style.display = "none";
            failurediv.style.display = "block";

            failurediv.innerHTML = message;
        } else {
            successdiv.style.display = "none";
            failurediv.style.display = "none";
        }
    }
</script>
</body>
</html>
