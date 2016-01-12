<!-- Navigation -->
<nav class="navbar navbar-inverse navbar-static-top" role="navigation" style="margin-bottom: 0">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="index.html">ADMIN PANEL</a>
    </div>
    <!-- /.navbar-header -->

    <ul class="nav navbar-top-links navbar-right">

        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                <i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
            </a>
            <ul class="dropdown-menu dropdown-user">
                <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                </li>
                <li><a href="index.php"><i class="fa fa-gear fa-fw"></i> Settings</a>
                </li>
                <li class="divider"></li>
                <li>
                <input type="hidden" name="uid" value="<?php echo _USER_; ?>">
                <input type="hidden" name="session" value="<?php echo _ID_; ?>">
                <input type="hidden" name="ip" value="<?php echo _IP_; ?>">
                <input type="hidden" name="ua" value="<?php echo $_SERVER['HTTP_USER_AGENT']; ?>">
                <a class="logout" href="logout.html"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                </li>
            </ul>
            <!-- /.dropdown-user -->
        </li>
        <!-- /.dropdown -->
    </ul>
    <!-- /.navbar-top-links -->

    <div class="navbar-primary sidebar" role="navigation">
        <div class="sidebar-nav navbar-collapse">
            <ul class="nav" id="side-menu">
                <li class="sidebar-search">
                    <div class="input-group custom-search-form">
                        <input type="text" class="form-control" placeholder="Search...">
                        <span class="input-group-btn">
                        <button class="btn btn-default" type="button">
                            <i class="fa fa-search"></i>
                        </button>
                    </span>
                    </div>
                    <!-- /input-group -->
                </li>
                <li>
                    <a href="index.php"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                </li>
                <!-- <li>
                    <a href="epin.php"><i class="fa fa-sitemap fa-fw"></i> EPins</a>
                </li>
                <li>
                    <a href="member.php"><i class="fa fa-users fa-fw"></i> Members  <span class="badge pull-right badge-mems"><i class='fa fa-spinner'></i></span></a>
                </li>
                <li>
                    <a href="gifts.php"><i class="fa fa-gift fa-fw"></i> Gifts <span class="badge pull-right badge-gifts"><i class='fa fa-spinner'></i></span></a>
                </li>
                <li>
                    <a href="genealogy.php"><i class="fa fa-sitemap fa-fw"></i> Genealogy</a>
                </li>
                <li>
                    <a href="payout.php"><i class="fa fa-money fa-fw"></i> Payout</a>
                </li>
                <li>
                    <a href="priority.php"><i class="fa fa-reorder fa-fw"></i> Priority</a>
                </li>
                <li>
                    <a href="refer.php"><i class="fa fa-share-alt-square fa-fw"></i> Referral History</a>
                </li>
                <li>
                    <a href="withdraw.php"><i class="fa fa-share-alt-square fa-fw"></i> Withdraw</a>
                </li>
                <li>
                    <a href="tickets.php"><i class="fa fa-wechat fa-fw"></i> Tickets <span class="badge pull-right badge-tickets"><i class='fa fa-spinner'></i></span></a>
                </li>
                <li>
                    <a href="sms.php"><i class="fa fa-mobile fa-fw"></i> Send SMS</a>
                </li>
                <li>
                    <a href="offer.php"><i class="fa fa-mobile fa-fw"></i> Offers</a>
                </li> -->
            </ul>
        </div>
        <!-- /.sidebar-collapse -->
    </div>
    <!-- /.navbar-static-side -->
</nav>