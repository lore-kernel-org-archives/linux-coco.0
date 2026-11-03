Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793690162;
	b=OFnJsqhzgwYzJdXAhekkxYsqiZ962Vv4mAcs/ERtGjH/f9fZZpN7UMZ5vsPjEhTyt8pd
	 Yz7GAGFoPMvK704EmZdWDIF2RwAFfI+8utjL6Ww8TlRWlpO+neIfblw9lu83SwRpUzfk8
	 /mkQNDynGg3bBCfAwsnTiIp/R+Mu9cKOzKd7/IUsYGQCJ/PcQtx4gO1DDhxar+B30ePF9
	 1tNVmy/P8PQ5c4uRCmUA00jKi0Z/545/sTZt9VbQZlvFzEPowf0v1nUuS/wzRc+6ZVt2g
	 9SS+UJfP4x2xp5kiiRyBZUGP+cKqEn/kRYLj/q81FRZuWOhCSaq/kwzPDTuugZ5SBaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793690162;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=q4y6B1icyNzjJObRP5v2+iWtsvF0W+PG7Ux6Z6hjgbY=;
	b=c6ypJAzQE+2len6Iak+8rVtNH2oIz2UXw5UZnB8R0Ulc0FtX9Fknqif/zW0c0Z0JKs6o
	 TQ8tcYOq+HaUHsiy0thSROuM03ScjiaClErh2QjmiJPM5iAnKvNe51o8SwFq7yjDUvpRY
	 SN/n5tFW7Isc1de/67EybBXwvo9/1MNf7sokqgVzSsVc7bVaBtrVgqcaEIX3mjeiSJlhP
	 Q/OQLeUHgY4qE7llZInvEFGmV1YuL6kaYvYvcFfdBx0GW0Ahbz0niM1nFGqfZIQR+Aw1l
	 +zhPgADJ6Uy4Yae5CSDkSDFR71R/dgt1l1fe9fVHp5P3sRkzRF/OY+5ccXgqqlpvCwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=GhECud09;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AF2606A329
	for <linux-coco@lists.linux.dev>; Tue,  3 Nov 2026 07:16:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89AF2606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=GhECud09
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3ad2b3b1c02so2062897a91.1
        for <linux-coco@lists.linux.dev>; Mon, 02 Nov 2026 23:16:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793690161; x=1794294961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q4y6B1icyNzjJObRP5v2+iWtsvF0W+PG7Ux6Z6hjgbY=;
        b=2IscjBM/ZnDYYYUcThsxU2ROnPjTGLtY4N3IgMATZaz4XoIPfEjggRWRC/2trUf+YQ
         +IrpVeX28CDMJHvjCQMp3d8bkQG/EFcBGq5SDZbPerVI8Ay6alimua9v7qX6NJ5Y8uaG
         mgDU3+pTihA0OWoVVF9MRzB6WOMooydiIb4LyYwST0m/0AS3SVysiM9IgxL6lLYlN5qc
         Gz7pocqPes7xQ1lGntTs7/WJmLLo+Fb06wS0yjfn2R+2+UJlWhUFd6hynqrmYQ0hU2FL
         N3x3+LyJEX8Fg6+vdVxCMj8jqt5EcZME5umgjccPie87GWS1cAwIvBaVvrTjjXtlr/r2
         0QwA==
X-Forwarded-Encrypted: i=1; AKwUvBz8xVb1rJ/AJh3C2uk878+V0Fu3AjIpZdoWcrIDSipw5rxr+Hvm+kOddVwXhHqo1Pk/riBe8hFdR1wJ@lists.linux.dev
X-Gm-Message-State: APuU4Z9A/DlJTOiwuBblX/vnoIAwHX66uOSLHIATorT075sybZsBkIEc
	QP0kB1f0n1xV1hI+uLL1PpVElwRlACkDEPGKEfdypLxTmbxowOQOt1Be4KyqsHWNJBvIM31KhyK
	VFoEDqia8/nCYEuhWdrf5huefiqfw39GJ06dGqsYxB7iCfWnEGtRsTlTN4dMxm5bh47+vHQP3ls
	OjubAmBZm6kS8Sw8yvfcLI9ty7s/Wnt3IXohSXsUcDLRoNUzywDl3b7rvMrQZf5xRBzVATrW8rw
	G2fdX926d+plQ==
X-Gm-Gg: AYBFou2eZ7xCMji3YMEEAhh6g8j/ni1dkBALryz9oRxz+qpvUyfEAa7DGNYMhjDeAui
	mHAJ1nIdn0AnjGvUUUX53qhNvz66OKzxG5RFnJscgIHmt9USMY4hQ0PV7kYFXmFAR+ImCqX2o7i
	ozbe8mRlBd9f9lNeGY16bcUv3O/M42ZNvHvyyQOb3dxKKT6gDpBeT7v8uUm9hP+FG2sK7gCvPid
	TQTtRhW0z83lOqYvz1LVPivyTUvfQUmqAu4NXpCgOKdnAF4jtIUpCz7NKUTaFC5eofilZceaxoX
	5cCilqXvkWKzU1+HVk62OnFvuAJpUIzzFVkLIiKb5lte+GHnX4ZxgdMYV0npwuaeK70Zm4vxFj+
	IscMqXYEJXqNgqQtzGpUuR0B0dUShIEQmPa8PuKOnRshlc8Cf+0K3lMbMxzkL9X8KRs2/hBySmw
	v7iJN/fRppmCIa99VtScY8Eno/WGbuwMhK
X-Received: by 2002:a17:90a:e7cd:b0:3a0:8050:2ec9 with SMTP id 98e67ed59e1d1-3ae897ccf9dmr9723996a91.16.1793690160789;
        Mon, 02 Nov 2026 23:16:00 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae881d509fsm4493449a91.5.2026.11.02.23.16.00
        for <linux-coco@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Nov 2026 23:16:00 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f322ef7d3so719880885a.0
        for <linux-coco@lists.linux.dev>; Mon, 02 Nov 2026 23:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793690159; x=1794294959; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q4y6B1icyNzjJObRP5v2+iWtsvF0W+PG7Ux6Z6hjgbY=;
        b=GhECud09CCG2xDSX3qdfb2dUa25DXE0ZtWCEIeulEoqEBZN+lYO3gK5CPPU/nBi9pY
         QjdnUj/9Efa8smtWYtZjwRG3/nTXc0OFLPU+LHhHqH66+L3xWrbbTjIsRJxFqUkyx/Lu
         qocYx55XFx1NmaMNjrEprxWh4ry1qAql+cy20=
X-Forwarded-Encrypted: i=1; AKwUvByqz1B3l7jgeNFvnCncxGsE1kv3WvG0ibYSrDW5QgmMxHmiQ0tTVWUdzDzNtvJtBT1bku8v0JdKJVjb@lists.linux.dev
X-Received: by 2002:a05:620a:2687:b0:943:b019:f011 with SMTP id af79cd13be357-94421719dd1mr1970190885a.28.1793690159393;
        Mon, 02 Nov 2026 23:15:59 -0800 (PST)
X-Received: by 2002:a05:620a:2687:b0:943:b019:f011 with SMTP id af79cd13be357-94421719dd1mr1970188385a.28.1793690158920;
        Mon, 02 Nov 2026 23:15:58 -0800 (PST)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9442581b2d2sm1018334585a.15.2026.11.02.23.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:15:52 -0800 (PST)
From: Zack Rusin <zack.rusin@broadcom.com>
To: Borislav Petkov <bp@alien8.de>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	x86@kernel.org
Cc: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	virtualization@lists.linux.dev,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kiryl Shutsemau <kas@kernel.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	linux-coco@lists.linux.dev,
	kvm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH v3 3/3] x86/cpufeatures: Remove unused VMware hypercall feature bits
Date: Tue,  3 Nov 2026 02:14:58 -0500
Message-ID: <c8e57b19d95fd8ffbfd13e7ab1c1ade551b1bd7b.1793685318.git.zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1793685318.git.zack.rusin@broadcom.com>
References: <cover.1793685318.git.zack.rusin@broadcom.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

The static-call conversion removed the alternative instruction templates
that used X86_FEATURE_VMCALL and X86_FEATURE_VMW_VMMCALL. Their remaining
users only force the bits during VMware setup; no code tests either bit.

Remove the forced capabilities and mark both positions free in the kernel
header. Neither feature has a cpuinfo name, so this changes no
userspace-visible flag.

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
 arch/x86/include/asm/cpufeatures.h | 4 ++--
 arch/x86/kernel/cpu/vmware.c       | 4 ----
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
index 61930f0d4578..b7633930020f 100644
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@ -233,8 +233,8 @@
 #define X86_FEATURE_VMMCALL		( 8*32+15) /* "vmmcall" Prefer VMMCALL to VMCALL */
 #define X86_FEATURE_XENPV		( 8*32+16) /* Xen paravirtual guest */
 #define X86_FEATURE_EPT_AD		( 8*32+17) /* "ept_ad" Intel Extended Page Table access-dirty bit */
-#define X86_FEATURE_VMCALL		( 8*32+18) /* Hypervisor supports the VMCALL instruction */
-#define X86_FEATURE_VMW_VMMCALL		( 8*32+19) /* VMware prefers VMMCALL hypercall instruction */
+// free: was #define X86_FEATURE_VMCALL ( 8*32+18) /* Hypervisor supports VMCALL */
+// free: was #define X86_FEATURE_VMW_VMMCALL ( 8*32+19) /* VMware prefers VMMCALL */
 // free: was #define X86_FEATURE_PVUNLOCK               ( 8*32+20) /* PV unlock function */
 #define X86_FEATURE_VCPUPREEMPT		( 8*32+21) /* PV vcpu_is_preempted function */
 #define X86_FEATURE_TDX_GUEST		( 8*32+22) /* "tdx_guest" Intel Trust Domain Extensions Guest */
diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index 6719c009f237..b5c1610ff408 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -492,10 +492,6 @@ static void __init vmware_set_capabilities(void)
 	setup_force_cpu_cap(X86_FEATURE_TSC_RELIABLE);
 	if (vmware_tsc_khz)
 		setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
-	if (vmware_hypercall_mode == CPUID_VMWARE_FEATURES_ECX_VMCALL)
-		setup_force_cpu_cap(X86_FEATURE_VMCALL);
-	else if (vmware_hypercall_mode == CPUID_VMWARE_FEATURES_ECX_VMMCALL)
-		setup_force_cpu_cap(X86_FEATURE_VMW_VMMCALL);
 }
 
 static unsigned long
