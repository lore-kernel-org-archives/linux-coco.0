Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30EA2F25F8
	for <linux-coco@lists.linux.dev>; Tue,  2 Dec 2025 22:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764714189; cv=none; b=AGIIl76FmTDtd5cY6Tah4/mUX+tXTtc6Z2G1xUymTC0kWAFWcqwOtjQ01xi8zstta22NfitYrya0Ao063tWBRBQ1gCBLbfN3F6NdwCNdIJjPPjhhSxCexiNA4IcOc5+UyhadtWWvGNRFqDqxHaN/BUYs5Q2nWGeMDq8IOOrBx+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764714189; c=relaxed/simple;
	bh=ZcuNzzPoo2yw6hdlpuEGbG2184p1Mxa6BinMtynAQOI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Car/Z+uqwR7mOJmI/0XhkNMQrKNFxXfK87YKv2+abt6peUgykZBFHcrry85B609zwtVRp9oNoKzNJ04kl/yNeWNoDtfsgtXUzxHmVrOWG0aMKaAaEkRtHFmoub/b57Ds+LoH+vBhYLQXyfntJ5CkWSZUg58B3ZiXqyipmeU0tKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V+PE5I8X; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V+PE5I8X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764714188; x=1796250188;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ZcuNzzPoo2yw6hdlpuEGbG2184p1Mxa6BinMtynAQOI=;
  b=V+PE5I8XDkvxUDABXcIOAKvKXemgTUqCxG+1O7A/Gdq12+OAKtpsSPP5
   HGg0jHUst3J3Af2xmnVtv8YhDRTFYU++gIBWqPwNRxZIdfXcLQpO81qgV
   2BsVszNm9y2lt72gmL5vVJJSuaqrvWmMCyF1y7CzQWexSAy/bbRQOeWTh
   VuVTqOXg7FObCz0/ii4DMOKj1YGXlSyXT0JwLXPayd3lTTP7XPLqvo2mp
   nfo/BpKuE6gvc71Kd7IPIDGhg5gDXvdg4Kp0Sb6EIlNP6SYICA6L7R0Gx
   CWqsVhETaygtKSZKpvrMPfqNlW7iYYYId8VMKbVUdv0AKkOM9D0whqRix
   A==;
X-CSE-ConnectionGUID: saUeuRHGQ3+1H1+9a7koUA==
X-CSE-MsgGUID: MmQoIeDLRkup9/crDu5gdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66588009"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="66588009"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 14:23:05 -0800
X-CSE-ConnectionGUID: HnWbKFU9ScWhCSoQjdqFRQ==
X-CSE-MsgGUID: MY7H2PMWQUS90Nk7E1gqhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="194599603"
Received: from skuppusw-desk2.jf.intel.com ([10.165.154.101])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 14:23:05 -0800
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
To: "Kirill A . Shutemov" <kas@kernel.org>
Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev
Subject: [PATCH v5] virt: tdx-guest: Handle GetQuote request error code
Date: Tue,  2 Dec 2025 14:22:57 -0800
Message-ID: <20251202222257.986825-1-sathyanarayanan.kuppuswamy@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The tdx-guest driver sends Quote requests to the quoting enclave via a
hypercall to obtain attestation evidence for the current TD state.
Quote generation can fail in two ways: a hypercall failure, or a Quote
failure that occurs after the VMM processes the request. The driver
currently handles only hypercall failures and timeout errors during
Quote processing. Update it to also handle other Quote failures
reported by the VMM (for more details, refer to GHCI spec, v1.5,
March 2023, sec titled "TDG.VP.VMCALL<GetQuote>).

This change does not break the existing ABI behavior. When a Quote
failure occurs, the VMM sets the Quote length to zero. Userspace
already interprets a zero-length Quote as a Quote generation failure.
Returning an explicit error in such cases makes the behavior more
consistent and simplifies error handling in userspace.

Fixes: f4738f56d1dc ("virt: tdx-guest: Add Quote generation support using TSM_REPORTS")
Reported-by: Xiaoyao Li <xiaoyao.li@intel.com>
Closes: https://lore.kernel.org/linux-coco/6bdf569c-684a-4459-af7c-4430691804eb@linux.intel.com/T/#u
Closes: https://github.com/confidential-containers/guest-components/issues/823
Reviewed-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
Acked-by: Kai Huang <kai.huang@intel.com>
Reviewed-by: Dan Williams <dan.j.williams@intel.com>
Tested-by: Mikko Ylinen <mikko.ylinen@linux.intel.com>
Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---

Changes since v4:
 * Rebased on top of v6.18-rc1
 * Added Tested-by tag from Mikko.
 * Added more details in commit log to clarify no user impact and also
   link to a related github issue.
 * Added error message for the failed  case.

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
index 4e239ec960c9..4e55958184d2 100644
--- a/drivers/virt/coco/tdx-guest/tdx-guest.c
+++ b/drivers/virt/coco/tdx-guest/tdx-guest.c
@@ -304,6 +304,11 @@ static int tdx_report_new_locked(struct tsm_report *report, void *data)
 		return ret;
 	}
 
+	if (quote_buf->status != GET_QUOTE_SUCCESS) {
+		pr_err("GetQuote request failed, status:%llx\n", quote_buf->status);
+		return -EIO;
+	}
+
 	buf = kvmemdup(quote_buf->data, quote_buf->out_len, GFP_KERNEL);
 	if (!buf)
 		return -ENOMEM;
-- 
2.43.0

