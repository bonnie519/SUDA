// SenderDlg.h : header file
//

#if !defined(AFX_SENDERDLG_H__2D6EA5D4_ABC2_429B_93E3_FE38DAF15E41__INCLUDED_)
#define AFX_SENDERDLG_H__2D6EA5D4_ABC2_429B_93E3_FE38DAF15E41__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

/////////////////////////////////////////////////////////////////////////////
// CSenderDlg dialog

class CSenderDlg : public CDialog
{
// Construction
public:
	CSenderDlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(CSenderDlg)
	enum { IDD = IDD_SENDER_DIALOG };

	CString	m_szStr;

	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CSenderDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(CSenderDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	//afx_msg void OnBtnString();
	afx_msg BOOL OnCopyData(CWnd* pWnd, COPYDATASTRUCT* pCopyDataStruct);
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
public:
	virtual BOOL PreTranslateMessage(MSG* pMsg);
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_SENDERDLG_H__2D6EA5D4_ABC2_429B_93E3_FE38DAF15E41__INCLUDED_)
