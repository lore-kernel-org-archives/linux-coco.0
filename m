Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1AD72F6179
	for <linux-coco@lists.linux.dev>; Fri, 16 Jan 2026 23:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768604601; cv=none; b=B0AsSo4pconzLoN9L058PKNU/iBJ0cUZ/cSb5FKverJy0pRK84Iju4coBirUXopdt+9+lFyksRUvgDMFsUIdUKwyir509yLtl+zxrWUquQdBI7NHWaypJxldyQmE17hZN6uzBpTHcByyS8ogwyUpuSDC/1w8XQVv8Od0hmTYp80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768604601; c=relaxed/simple;
	bh=lIacmZHCpJUFaWj+a3HC1itpZAGCPeTr7lNOkuwjTF4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tapGJFxF2YZWFlcqLfzsJql4oeSs3JKR/jjjNZ3hUP8mKXhmYMlNCe11RWMfdj3b0ETYXWX6OTwxpfFKPKv30Z796yxZARYHRT45rO5v8oZl387zB+5JMCHVuMnYCcjguqWpWRpC54SSXN+3jgM+rsDdynHP7ZlrD4MBBwhDBgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ix7XF9f1; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ix7XF9f1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768604598; x=1800140598;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=lIacmZHCpJUFaWj+a3HC1itpZAGCPeTr7lNOkuwjTF4=;
  b=ix7XF9f1o+7fSSAbfKvGEVSGHsh8rCQ4DrO9LX3eTdFuWsNm6gnBxcXN
   UyqE3koUIT26leac4cJV7SYZBi1ZU4Mpf+IzIggi6u07bExY1uLZUNc6M
   npxkd8GDEYu/z73MCbNosqdrcRZMDRAuhmRnjtu/Ucn7DbCasTzALXLqM
   ZQCbETRPDofMnDd/fj+ykWu93EedXOpU6/emzo6ZAc6u2jstFYHjuC1vL
   qgm1g/PG94FSmxEqaKj9qxDhDJbgtow6XtgZj0tP0vH3zKkEWvTstuo1F
   xX2vczxNNhZ7sgATz/nIggSIJg6Qa2ispT7c27twsFwmN9LC5f5KbjXsn
   Q==;
X-CSE-ConnectionGUID: +HE9z0AkSnG8ta0mC9HVUg==
X-CSE-MsgGUID: KI7zFDz1Sz69KIxelCq8Fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="73553488"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="73553488"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 15:03:18 -0800
X-CSE-ConnectionGUID: 8sC1BIWsQzmjFE9qGoUc1w==
X-CSE-MsgGUID: S7ddWYiBRGeYvKv7PXQkTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="209857324"
Received: from skuppusw-desk2.jf.intel.com ([10.165.154.101])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 15:03:18 -0800
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
To: "Kirill A . Shutemov" <kas@kernel.org>,
	x86@kernel.org
Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev
Subject: [PATCH v6] virt: tdx-guest: Return error for GetQuote failures
Date: Fri, 16 Jan 2026 15:03:15 -0800
Message-ID: <20260116230315.4023504-1-sathyanarayanan.kuppuswamy@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, the GetQuote request handler returns explicit errors for
hypercall-level failures and timeouts, but it ignores some VMM
failures (e.g., GET_QUOTE_SERVICE_UNAVAILABLE), for which it returns
success with a zero-length Quote. This makes error handling in
userspace more complex.

The VMM reports failures via the status field in the shared GPA header,
which is inaccessible to userspace because only the Quote payload is
exposed to userspace. Parse the status field in the kernel and return
an error for Quote failures.

This preserves existing ABI behavior as userspace already treats a
zero-length Quote as a failure.

Refer to GHCI specification [1], section "TDG.VP.VMCALL <GetQuote>",
Table 3-10 and Table 3-11 for details on the GPA header and
GetQuote status codes.

Fixes: f4738f56d1dc ("virt: tdx-guest: Add Quote generation support using TSM_REPORTS")
Reported-by: Xiaoyao Li <xiaoyao.li@intel.com>
Closes: https://lore.kernel.org/linux-coco/6bdf569c-684a-4459-af7c-4430691804eb@linux.intel.com/T/#u
Closes: https://github.com/confidential-containers/guest-components/issues/823
Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Tested-by: Mikko Ylinen <mikko.ylinen@linux.intel.com>
Reviewed-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
Reviewed-by: Dan Williams <dan.j.williams@intel.com>
Acked-by: Kai Huang <kai.huang@intel.com>
Link: https://cdrdv2.intel.com/v1/dl/getContent/858626 # [1]
---

Changes since v5:
 * Simplified the commit message to focus on the constraint of
   GPA header inaccessibility (Dave).
 * Reordered commit tags as per kernel process (Dave).
 * Refined the commit title to reflect the fix.
 * Replaced pr_err() with pr_debug() for error log to avoid dmesg spam.
 * Added Link to GHCI spec.

Changes since v4:
 * Rebased on top of v6.18-rc1
 * Added Tested-by tag from Mikko.
 * Added more details in commit log to clarify no user impact and also
   link to a related github issue.
 * Added error message for the failed case.

Changes since v3:
 * Rebased on top of v6.9-rc1
 * Added Dan's Reviewed-by tag.

Changes since v2:
 * Updated the commit log (Dan)
 * Removed pr_err message.

Changes since v1:
 * Updated the commit log (Kirill)
 drivers/virt/coco/tdx-guest/tdx-guest.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/virt/coco/tdx-guest/tdx-guest.c b/drivers/virt/coco/tdx-guest/tdx-guest.c
index 4e239ec960c9..a3c8f5c19bae 100644
--- a/drivers/virt/coco/tdx-guest/tdx-guest.c
+++ b/drivers/virt/coco/tdx-guest/tdx-guest.c
@@ -304,6 +304,11 @@ static int tdx_report_new_locked(struct tsm_report *report, void *data)
 		return ret;
 	}
 
+	if (quote_buf->status != GET_QUOTE_SUCCESS) {
+		pr_debug("GetQuote request failed, status:%llx\n", quote_buf->status);
+		return -EIO;
+	}
+
 	buf = kvmemdup(quote_buf->data, quote_buf->out_len, GFP_KERNEL);
 	if (!buf)
 		return -ENOMEM;
-- 
2.43.0

