/*-------------------------------------------------------------------------------*/
/* Copyright (C) 2013                                                            */
/*                                                                               */
/* This file is part of ezilla.                                                  */
/*                                                                               */
/* This program is free software: you can redistribute it and/or modify it       */
/* under the terms of the GNU General Public License as published by             */
/* the Free Software Foundation, either version 3 of the License, or             */
/* (at your option) any later version.                                           */
/*                                                                               */
/* This program is distributed in the hope that it will be useful, but WITHOUT   */
/* ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS */
/* FOR A PARTICULAR PURPOSE. See the GNU General Public License                  */
/* for more details.                                                             */
/*                                                                               */
/* You should have received a copy of the GNU General Public License along with  */
/* this program. If not, see <http://www.gnu.org/licenses/>                      */
/*                                                                               */
/* Author: Pulipuli Chen <pulipuli.chen@gmail.com>                               */
/*-------------------------------------------------------------------------------*/


var mfs_tab_content =
'';

var mfs_tab = {
    title: '<i class="icon-storage"></i>'+tr("MooseFS"),
    content: '<iframe id="mfs_iframe" src="http://140.119.61.222:9425/" width="100%" height="100%"></iframe>',
    //tabClass: "subTab"
};

Sunstone.addMainTab('mfs_tab',mfs_tab);

$(document).ready(function () {

    var _setup_mfs_iframe_height = function () {
        var _mfs_iframe = $('#mfs_iframe');
        _mfs_iframe.height(($('body').height()-76));
    };

    _setup_mfs_iframe_height();

    $(window).resize(_setup_mfs_iframe_height);

});
