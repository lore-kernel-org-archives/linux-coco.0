Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03EF23B63E
	for <linux-coco@lists.linux.dev>; Sat,  6 Dec 2025 01:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764983481; cv=none; b=F5lMK6U5DWJioZDYLEDgeLjrwVxjl0MQVudwY8WZbS0NWuFRqk9g+MYfPhEwprYdNcg0lbye0B8r/F4WOSxsKa8yiHQAk8cgHjL3T859rgZsSVGAizh42XaQC+Nc77NEgDbwoTvVAHtGLhiAjN7DQQpJMH5Y5NRzk43eXgFtXd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764983481; c=relaxed/simple;
	bh=dD0zdMBxcirbZcOCLQPI4IDX7thvsilC04qKPz4Ct6Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=j/OcARz7YIeQYOwh345oBCmrokYUaU6QS7u6G1HsiYvXynl4mWbAwi0lo6SwEx99bkWpLljJhB3K9cU1T7gCFbbnoNDi+O3vIm9HP6+0C1kIy3OqtWuO3p0sLBB9u5g9CpVJR0BlmbS81GJhwJrKkRyI7Qu1VBl6QGC/bOBiIf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ym2Ihcnk; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ym2Ihcnk"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-3438744f12fso6721650a91.2
        for <linux-coco@lists.linux.dev>; Fri, 05 Dec 2025 17:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764983479; x=1765588279; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=rVtJBDhchDrLagfgGom7nKilzuyDMEWeeU45x47h0PI=;
        b=Ym2IhcnkdwLFQfKDu/Q/Lq8xcbrmekj6EAOEQOKuG0mbtqWuf723MjQKFd90P3mmL4
         XNi64Y4HKwGzXuQIKJDQAkoYgsy1kyJeBiOgSspQFWGQaUqAmmsRoQROvn9vjcatslp3
         iTFmFKD4uGo3Y+n3SoUvAsmM37jeelu81Pf0blsrd3L1kBuwt7IcA1TBkt2P089HVMZs
         d4emv15UPmCqjU5FzfNKddvYInoYVpKHzWl1V7jG+q9Mgmy1sOxK9FJzCULeMgW7p5vv
         WZE/tmt0bV/WJTNh8f9IO+k6rJ09QIeQFY/FHnmiUQpkOIKmvqiUmQU7zgzKDCpBM6YL
         nsDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764983479; x=1765588279;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rVtJBDhchDrLagfgGom7nKilzuyDMEWeeU45x47h0PI=;
        b=dUsfzYTjnrjr9DeHx/0hReraxwH3eGMuazGhFu/RuFyfkmVW0PKxEZfic91lkTK52d
         VjpygJvqL0V+vHfT/6AOoqUTnhqpzD8HzbmfYwAVsBbC4mhb2qGKnPbft465yiDXJxQM
         naKv8uxiUJrsqQeSFdL44PJLixsHE/Ep5RF7DB+InpYcJXbTi79VNvyIzHHcDIcrESvd
         pXGnVYNAYi0EyducEVoie6fWAozIynAfuzGPoqD1vhv/Ck7lxQ5JKsrKBG8nRkPS4/QP
         J2O+IhxcOOyfSY0fgHvepkYLkY1m/mJP7wABIc0SbeSAKn8bNGwQqcyEkWyLIJ6OcXBp
         jfsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdjP56zKowLyQ/r8SC1Z4T2e0jnbclQowfKSf60ul9SGqMkzlg7XcclP/TnkX+NgXhX3J78fPUgGxQ@lists.linux.dev
X-Gm-Message-State: AOJu0YxUNK9POLUhViKj+7vFub/kDAoVVjtdl97XzL1L7HhrUl/ohR7p
	6HY5LYg9ndBW5EK4kPPOhMw1EhtrTWdTIZG2GpqLspnni4J+DDt+M0XBFE55CHGZzjO3xtOT3Fr
	j+eE+Kw==
X-Google-Smtp-Source: AGHT+IERf67I/KSjwUV4VBGzOV5LWpvLTz4kgH2qJZnW3MJYfCI+Tp3EG4cQDFHBfXE9LirgMVmyzwQKLSk=
X-Received: from pjbfz21.prod.google.com ([2002:a17:90b:255:b0:340:4910:738f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2f08:b0:339:ec9c:b275
 with SMTP id 98e67ed59e1d1-349a253dc8emr794762a91.6.1764983478902; Fri, 05
 Dec 2025 17:11:18 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri,  5 Dec 2025 17:10:53 -0800
In-Reply-To: <20251206011054.494190-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251206011054.494190-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251206011054.494190-7-seanjc@google.com>
Subject: [PATCH v2 6/7] x86/virt/tdx: Use ida_is_empty() to detect if any TDs
 may be running
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	kvm@vger.kernel.org, Chao Gao <chao.gao@intel.com>, 
	Dan Williams <dan.j.williams@intel.com>
Content-Type: text/plain; charset="UTF-8"

Drop nr_configured_hkid and instead use ida_is_empty() to detect if any
HKIDs have been allocated/configured.

Suggested-by: Dan Williams <dan.j.williams@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/virt/vmx/tdx/tdx.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index 5cf008bffa94..ef77135ec373 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -58,8 +58,6 @@ static LIST_HEAD(tdx_memlist);
 static struct tdx_sys_info tdx_sysinfo __ro_after_init;
 static bool tdx_module_initialized __ro_after_init;
 
-static atomic_t nr_configured_hkid;
-
 typedef void (*sc_err_func_t)(u64 fn, u64 err, struct tdx_module_args *args);
 
 static inline void seamcall_err(u64 fn, u64 err, struct tdx_module_args *args)
@@ -195,7 +193,7 @@ static int tdx_offline_cpu(unsigned int cpu)
 	int i;
 
 	/* No TD is running.  Allow any cpu to be offline. */
-	if (!atomic_read(&nr_configured_hkid))
+	if (ida_is_empty(&tdx_guest_keyid_pool))
 		goto done;
 
 	/*
@@ -1542,22 +1540,15 @@ EXPORT_SYMBOL_GPL(tdx_get_nr_guest_keyids);
 
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
 EXPORT_SYMBOL_GPL(tdx_guest_keyid_alloc);
 
 void tdx_guest_keyid_free(unsigned int keyid)
 {
 	ida_free(&tdx_guest_keyid_pool, keyid);
-	atomic_dec(&nr_configured_hkid);
 }
 EXPORT_SYMBOL_GPL(tdx_guest_keyid_free);
 
-- 
2.52.0.223.gf5cc29aaa4-goog

