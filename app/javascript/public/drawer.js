$( document ).ready(function(){
  $('.drawer').drawer({
    class: {
      nav: 'drawer-nav',
      toggle: 'drawer-toggle',
      overlay: 'drawer-overlay',
      open: 'drawer-open',
      close: 'drawer-close',
      dropdown: 'drawer-dropdown'
    },
    iscroll: {
      // Configuring the iScroll
      // https://github.com/cubiq/iscroll#configuring-the-iscroll
      mouseWheel: true,
      preventDefault: false
    },
    showOverlay: true
  });

  var movefun = function( event ){
  event.preventDefault();}

// ドロワーナビが開いたとき
  $('.drawer').drawer();
  $('.drawer').on('drawer.opened', function(){
// スクロール停止の処理
    window.addEventListener( 'touchmove' , movefun , { passive: false } );
  });
// ドロワーナビが閉じたとき
  $('.drawer').on('drawer.closed', function(){
// スクロール停止することを停止する処理
    window.removeEventListener( 'touchmove' , movefun, { passive: false } );
  });
});
