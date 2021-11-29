
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="row clearfix">
    <div class="col-md-12 column">
        <nav class="navbar navbar-default" role="navigation">
            <div class="navbar-header">
                 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> <a class="navbar-brand" href="#">Brand</a>
            </div>

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li class="active">
                         <a href="#">功能1</a>
                    </li>
                    <li class="dropdown">
                         <a href="#" class="dropdown-toggle" data-toggle="dropdown">下拉功能1<strong class="caret"></strong></a>
                        <ul class="dropdown-menu">
                            <li>
                                 <a href="#">Action</a>
                            </li>
                            <li>
                                 <a href="#">Another action</a>
                            </li>
                            <li>
                                 <a href="#">Something else here</a>
                            </li>
                            <li class="divider">
                            </li>
                            <li>
                                 <a href="#">Separated link</a>
                            </li>
                            <li class="divider">
                            </li>
                            <li>
                                 <a href="#">One more separated link</a>
                            </li>
                        </ul>
                    </li>
                </ul>
                <form class="navbar-form navbar-left" role="search">
                    <div class="form-group">
                        <input type="text" class="form-control" />
                    </div> <button type="submit" class="btn btn-default">查询</button>
                </form>
                <ul class="nav navbar-nav navbar-right">
                    <li>
                         <a href="#">登录</a>
                    </li>
                    <li>
                         <a href="#">注册</a>
                    </li>
                    <li>
                         <div class="row clearfix">
                              <div class="col-md-12 column">
                                   <ul class="nav nav-pills">
                                        <li class="active" style = "background-color:#f8f8f8 color: #fff" width:130.35px height:50px>
                                             <%-- <a href="#"> <span class="badge pull-right">42</span> 我的购物车</a> --%>
                                             <a href="#">我的购物车<span class="badge" style = "background-color:#008000">42</span></a>
                                        </li>
                                   </ul>
                              </div>
                         </div>
                    </li>
                    <li class="dropdown">
                         <a href="#" class="dropdown-toggle" data-toggle="dropdown">下拉功能2<strong class="caret"></strong></a>
                        <ul class="dropdown-menu">
                            <li>
                                 <a href="#">Action</a>
                            </li>
                            <li>
                                 <a href="#">Another action</a>
                            </li>
                            <li>
                                 <a href="#">Something else here</a>
                            </li>
                            <li class="divider">
                            </li>
                            <li>
                                 <a href="#">Separated link</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>

        </nav>
    </div>
</div>


