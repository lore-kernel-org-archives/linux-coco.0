Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E532DEA75
	for <linux-coco@lists.linux.dev>; Sat, 14 Feb 2026 01:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771032454; cv=none; b=Y0QIlQ9Mf4lDb4QdhfYJyAARniz6dKWu7GZbngONP3URoK2Aih8YkgWMt6VdplQaGLR3hYd5KwQQG6GaRC7WM/BpAgjaShYyrtD0PLXd+c37M05ypB2p5hloaGumgeJGVjZkhey+Azi2lARYz+4oPanlhpKomjbi+zbOY5rWqOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771032454; c=relaxed/simple;
	bh=2jURTAzz81y5fmKZ0nkZ+MRnOfqPxSPZP5ZzXKImRwE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Mx/Xaow4F+MKR7xdDHUcY3xKX3iH9nINgAlKyBtVI8qI69OHRVMgLGFT1krQYsInVh1fEyGOly24DHxB3J0euzxX+lmO73ty3X804fv5aUM7d4gyZGqNWqZnQn0Xv4sK+Im26/hN9GCi+xQrAVcmGUKn3gDwZhtTvBi1Ya8a/0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GHbGHIdB; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GHbGHIdB"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2a8f8c81d02so14263215ad.2
        for <linux-coco@lists.linux.dev>; Fri, 13 Feb 2026 17:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771032451; x=1771637251; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=hrsNdfLewzqAJ4j/aZKlf6lqr1ErBy4WWW6V+vzZ7i0=;
        b=GHbGHIdBlhg5KGDlKMEFRTu/Z4NU0nyxJKPDpCaBJwAvYh0LvAdeDuT5XLNj/UMIlj
         8IJ7tc1EPa5SVF1W3rkmThogF63TJphlgjZslULxXRZMPYaw7yc2WP0EqiEaC31rMe9/
         d0+vsHpJ9CUMVQWZiG04nf7PwI0gBytDedkXpHfJWhe6vljl8+yXymIf11zO8yiqtLlZ
         w9ThKdidw//wc0gxzIptEa6deS95Ty9HWOnF1xQo3E0sLYwLLJ1HOQPIcQZ6Ondssalm
         Sw/JxHNLJiErcKlt8GXc74XTOz/9XkS+Lq9wX2tg2w/Yax+Pg6s4YC4Op8tbsA0Z/GpG
         CzAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771032451; x=1771637251;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hrsNdfLewzqAJ4j/aZKlf6lqr1ErBy4WWW6V+vzZ7i0=;
        b=fCO0SbaQ6TPLd6pYBvo8dxb8+ckWus4XJCNPp7qMi0dUuhiUbFTn1lwIYFMg8xDyaS
         hYW/GbH9K3UqT9ixY/uYOBvglnvXTy79IwBjmSLFfF18AvtrTKbufCBx9OGFYDn/HQ1s
         N80lh1RkyuMZKU9JunVFJE3+1Uw540Q69E20S7QbWbxTz/bbhndDSSa5izBBHTGHh7J+
         1yVTyMD7+TB98QL1oudnIJfd8kC408y1REncx23PGQFcDeZeEWhSHMdqpte+SDdwchhh
         xcC1lQVcVM1V6hOiIQeA9gmginrfw1DG0iXHKtnOMv9dAFxoluRHFwWYj50L6k8U3Fj6
         a9lA==
X-Forwarded-Encrypted: i=1; AJvYcCUT03jp+RxuNH9MxIZykK5RtTW2ZAwjIrdCjefi0UzsZ+elIFfUBxslujsp6KTILFCkfojXD5bWn4u9@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2eI2NdZVttq9buE9mZmMsXsAkILwZlQEi77W7Kgsxy3lzziyX
	hIZ4YcLh3gfTWCajc8pTdmhCW94LijnDSMXhUobMB503R+48zB/A+fEIqlzJygXVRNdyDeUVC+d
	nnRBS9Q==
X-Received: from plqu18.prod.google.com ([2002:a17:902:a612:b0:2a7:8c71:aa97])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:c947:b0:2aa:d647:b3ed
 with SMTP id d9443c01a7336-2ab505bd0fdmr36326685ad.34.1771032450744; Fri, 13
 Feb 2026 17:27:30 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 13 Feb 2026 17:27:00 -0800
In-Reply-To: <20260214012702.2368778-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260214012702.2368778-1-seanjc@google.com>
X-Mailer: git-send-email 2.53.0.310.g728cabbaf7-goog
Message-ID: <20260214012702.2368778-15-seanjc@google.com>
Subject: [PATCH v3 14/16] x86/virt/tdx: Use ida_is_empty() to detect if any
 TDs may be running
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	kvm@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Chao Gao <chao.gao@intel.com>, Xu Yilun <yilun.xu@linux.intel.com>, 
	Dan Williams <dan.j.williams@intel.com>
Content-Type: text/plain; charset="UTF-8"

Drop nr_configured_hkid and instead use ida_is_empty() to detect if any
HKIDs have been allocated/configured.

Suggested-by: Dan Williams <dan.j.williams@intel.com>
Reviewed-by: Dan Williams <dan.j.williams@intel.com>
Reviewed-by: Chao Gao <chao.gao@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/virt/vmx/tdx/tdx.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index ddbab87d2467..bdee937b84d4 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -59,8 +59,6 @@ static LIST_HEAD(tdx_memlist);
 static struct tdx_sys_info tdx_sysinfo __ro_after_init;
 static bool tdx_module_initialized __ro_after_init;
 
-static atomic_t nr_configured_hkid;
-
 typedef void (*sc_err_func_t)(u64 fn, u64 err, struct tdx_module_args *args);
 
 static inline void seamcall_err(u64 fn, u64 err, struct tdx_module_args *args)
@@ -194,7 +192,7 @@ static int tdx_offline_cpu(unsigned int cpu)
 	int i;
 
 	/* No TD is running.  Allow any cpu to be offline. */
-	if (!atomic_read(&nr_configured_hkid))
+	if (ida_is_empty(&tdx_guest_keyid_pool))
 		goto done;
 
 	/*
@@ -1545,22 +1543,15 @@ EXPORT_SYMBOL_FOR_KVM(tdx_get_nr_guest_keyids);
 
 int tdx_guest_keyid_alloc(void)
 {
-	int ret;
-
-	ret = ida_alloc_range(&tdx_guest_keyid_pool, tdx_guest_keyid_start,
-			      tdx_guest_keyid_start + tdx_nr_guest_keyids - 1,
-			      GFP_KERNEL);
-	if (ret >= 0)
-		atomic_inc(&nr_configured_hkid);
-
-	return ret;
+	return ida_alloc_range(&tdx_guest_keyid_pool, tdx_guest_keyid_start,
+			       tdx_guest_keyid_start + tdx_nr_guest_keyids - 1,
+			       GFP_KERNEL);
 }
 EXPORT_SYMBOL_FOR_KVM(tdx_guest_keyid_alloc);
 
 void tdx_guest_keyid_free(unsigned int keyid)
 {
 	ida_free(&tdx_guest_keyid_pool, keyid);
-	atomic_dec(&nr_configured_hkid);
 }
 EXPORT_SYMBOL_FOR_KVM(tdx_guest_keyid_free);
 
-- 
2.53.0.310.g728cabbaf7-goog

