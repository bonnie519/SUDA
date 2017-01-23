// SenderDlg.cpp : implementation file
//

#include "stdafx.h"
#include "Sender.h"
#include "SenderDlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CSenderDlg dialog

CSenderDlg::CSenderDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CSenderDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CSenderDlg)
	m_szStr = _T("");

	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CSenderDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CSenderDlg)
	DDX_Text(pDX, IDC_EDT_STR, m_szStr);

	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CSenderDlg, CDialog)
	//{{AFX_MSG_MAP(CSenderDlg)
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	//ON_BN_CLICKED(IDC_BTN_STRING, OnBtnString)
	ON_WM_COPYDATA()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CSenderDlg message handlers

BOOL CSenderDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	// Set the icon for this dialog.  The framework does this automatically
	//  when the application's main window is not a dialog
	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon
	
	// TODO: Add extra initialization here
	STARTUPINFO si;
	memset(&si,0,sizeof(STARTUPINFO));//初始化si在内存块中的值（详见memset函数）
	si.cb=sizeof(STARTUPINFO);
	si.dwFlags=STARTF_USESHOWWINDOW;
	si.wShowWindow=SW_SHOW;
	PROCESS_INFORMATION pi;//必备参数设置结束
	if(!CreateProcess(TEXT("..\\Receiver\\Debug\\Receiver.exe"),
		NULL,
		NULL,
		NULL,
		FALSE,
		0,
		NULL,
		NULL,
		&si,
		&pi
		))
	{
		MessageBox("创建接收方失败!");
		return false;
	}

	return TRUE;  // return TRUE  unless you set the focus to a control
}

// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework.

void CSenderDlg::OnPaint() 
{
	if (IsIconic())
	{
		CPaintDC dc(this); // device context for painting

		SendMessage(WM_ICONERASEBKGND, (WPARAM) dc.GetSafeHdc(), 0);

		// Center icon in client rectangle
		int cxIcon = GetSystemMetrics(SM_CXICON);
		int cyIcon = GetSystemMetrics(SM_CYICON);
		CRect rect;
		GetClientRect(&rect);
		int x = (rect.Width() - cxIcon + 1) / 2;
		int y = (rect.Height() - cyIcon + 1) / 2;

		// Draw the icon
		dc.DrawIcon(x, y, m_hIcon);
	}
	else
	{
		CDialog::OnPaint();
	}
}

// The system calls this to obtain the cursor to display while the user drags
//  the minimized window.
HCURSOR CSenderDlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

BOOL CSenderDlg::OnCopyData(CWnd* pWnd, COPYDATASTRUCT* pCopyDataStruct) 
{
	// TODO: Add your message handler code here and/or call default
	this->m_szStr = (LPCSTR)(pCopyDataStruct->lpData);
	UpdateData(false);
	::AfxMessageBox(_T("Receive Succeeded!"));
	return CDialog::OnCopyData(pWnd, pCopyDataStruct);
}


BOOL CSenderDlg::PreTranslateMessage(MSG* pMsg)
{
	// TODO: 在此添加专用代码和/或调用基类
	if (WM_KEYFIRST <= pMsg->message && pMsg->message <= WM_KEYLAST)
	{
      //判断是否按下键盘Enter键
		if(pMsg->wParam==VK_RETURN)
		{
			UpdateData();
			if(this->m_szStr.IsEmpty())
			{
				this->m_szStr=_T("Hello");
				UpdateData(false);
			}
			this->m_szStr+="\0";
			HWND hWndRcv=::FindWindow(NULL,"Receiver");
			if(hWndRcv==NULL)
			{
				::AfxMessageBox(_T("发送不成功，找不到P2窗口！"));
				return FALSE;
			}
			COPYDATASTRUCT cpd;
			cpd.dwData=1;
			cpd.cbData=this->m_szStr.GetLength()+1;
			cpd.lpData=(void *)this->m_szStr.GetBuffer(cpd.cbData);
			::SendMessage(hWndRcv,WM_COPYDATA,(WPARAM)this->m_hWnd,(LPARAM)&cpd);
			this->m_szStr.ReleaseBuffer();
			::AfxMessageBox(_T("P1发送成功！"));
			return TRUE;
		}
	}
	return CDialog::PreTranslateMessage(pMsg);
}
