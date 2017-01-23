// ReceiverDlg.cpp : implementation file
//

#include "stdafx.h"
#include "Receiver.h"
#include "ReceiverDlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CReceiverDlg dialog

CReceiverDlg::CReceiverDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CReceiverDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CReceiverDlg)
	m_szStr = _T("");

	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CReceiverDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CReceiverDlg)
	DDX_Text(pDX, IDC_EDT_STR, m_szStr);

	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CReceiverDlg, CDialog)
	//{{AFX_MSG_MAP(CReceiverDlg)
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_WM_COPYDATA()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CReceiverDlg message handlers

BOOL CReceiverDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	// Set the icon for this dialog.  The framework does this automatically
	//  when the application's main window is not a dialog
	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon
	
	// TODO: Add extra initialization here
	
	return TRUE;  // return TRUE  unless you set the focus to a control
}

// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework.

void CReceiverDlg::OnPaint() 
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
HCURSOR CReceiverDlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

BOOL CReceiverDlg::OnCopyData(CWnd* pWnd, COPYDATASTRUCT* pCopyDataStruct) 
{
	// TODO: Add your message handler code here and/or call default
	this->m_szStr = (LPCSTR)(pCopyDataStruct->lpData);
	UpdateData(false);
	::AfxMessageBox(_T("P2接收成功!"));
	return CDialog::OnCopyData(pWnd, pCopyDataStruct);
}
