// 에디터 내용
ClassicEditor
.create( document.querySelector( '#editor' ), {
	ckfinder: {
        uploadUrl: '/trytri/fileupload.do' // 내가 지정한 업로드 url (post로 요청감)
	},
	alignment: {
        options: [ 'left', 'center', 'right' ]
    }
} )
.then( editor => {
    const toolbarContainer = document.querySelector( '#toolbar-container' );

    toolbarContainer.appendChild( editor.ui.view.toolbar.element );
} )
.catch( error => {
    console.error( error );
} );