Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F91326D53
	for <linux-coco@lists.linux.dev>; Thu, 29 Jan 2026 01:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769649338; cv=none; b=pppKqztTXOArHPuAOaZt1A9oP2D5XZo8bAMo9nresSDUSlhVrT/9UUtJ4vke/T4bkZFF15tvZmVU4IbE2n2WctNjR5KxGO7/CoSL7Arag3VIu7Qew2uiDAAvbzRjHg4ksAuooXo850Rxkim2TABc7AJjv+oqQvod0pEmU3RdguY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769649338; c=relaxed/simple;
	bh=i+BaQipwcwIk83xd9q3EaqDNGVAGV/ShuF7c8g62crA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=T0O3v58HydlIYegvYNk4oxYsDehLl/qMoORoS1u5qrrDvyvLvGd7ImkZ0j3w814QpygONPOCNHaUkxvJkxwom7D4nTfvGgt4MT7f+PCD+QbW8tP0OkvL8MUh735Wequ86LVXff9lV39s1EYBMSRKUsSCbw+tvkpfWjG4fq0DgVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zE+UyZp1; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zE+UyZp1"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c6136af8e06so220673a12.1
        for <linux-coco@lists.linux.dev>; Wed, 28 Jan 2026 17:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769649335; x=1770254135; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=7CglUg76d+5MQRtd6QcMDKkRS3BGZoZjOLZ6NJir0yk=;
        b=zE+UyZp1pLaM+iSrR2NRcC6aoz7ql0T1TBbp2RguAAvpJT0qwIxG1LFjdKiepJykE/
         vvEILQkYSSRaONZs2Dbpw9lJW5NZv964AbZMMh69vYbPJCfhMcqW4Hn8yMnFiZ40lhlk
         ugLd12xbsh68atYewmF0z1HxDmj4Tq9XphaR+7tJblRcyUkp8iEyGkkxJH76bJO5oZZ8
         dqnWIziZ+ydKcb/NRCHHPXL5N5kSlSNx5XcqstD6rVM6tclwBFy1o3VPoJHYgYu/DJ65
         Bf6kB3HrOWKDQUXtlLcyMgfwD126Kr66d0Z88ekvY7ZKShX2aEyt+SoEC6kXFhrORZfc
         IjDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769649335; x=1770254135;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7CglUg76d+5MQRtd6QcMDKkRS3BGZoZjOLZ6NJir0yk=;
        b=Iqxm+klBSntrwYMsuM7byuUZLyIZwreofLO0bNgwEttCq6IRAIex+tw9vqe8/xAjhU
         uuVrJYEGvo6sC2bM+PV+3Jf5U8Wrjj2w3HpfOMCoI86dmZDFXl+/HakcJBhrt2Md/fu4
         2rwYxRdvmhY1s/vd5Biz2y5ooPXVMLzw9mnh50SkEdxI4S4Gvnxjdq0Y/OxNRCbkMmVA
         lzoqmzC2420943ey2jkuWZ9lnEnUgZLpnoL2jz0DxF2pFK68WC7dFpfY1liBvCmjrbZm
         zupKDRrNuxi0QUyB21R7qwJirgJ948xQDsuKqEBj+Zg1rMjnZiyDic5hjoOKdC8D9HcT
         N+Uw==
X-Forwarded-Encrypted: i=1; AJvYcCWgF5kFeHfdB+xnb6bc1AwWPfBAgbNotMYmCa8kdS6Bua+fvxWJc8vO5RqZCIfeyMwWZry6JpC7191n@lists.linux.dev
X-Gm-Message-State: AOJu0YxWM3uRagU5Y5OyJG9bctjzqk+wyXVw4YFvc+ekawNQhMxBgc+r
	pgpvL0uDPEwRyX1H9D3vja8HWT6doPVfpRCyf5JTZx/vZ6f2G2IMuOnYRf3WiOoL3pxU7CP43yc
	ea2z7ZQ==
X-Received: from pjbft8.prod.google.com ([2002:a17:90b:f88:b0:352:bd7e:99e7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:314d:b0:340:ecad:414
 with SMTP id 98e67ed59e1d1-353fed8797emr5977548a91.27.1769649335221; Wed, 28
 Jan 2026 17:15:35 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 28 Jan 2026 17:14:36 -0800
In-Reply-To: <20260129011517.3545883-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260129011517.3545883-1-seanjc@google.com>
X-Mailer: git-send-email 2.53.0.rc1.217.geba53bf80e-goog
Message-ID: <20260129011517.3545883-5-seanjc@google.com>
Subject: [RFC PATCH v5 04/45] KVM: x86: Make "external SPTE" ops that can fail
 RET0 static calls
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	kvm@vger.kernel.org, Kai Huang <kai.huang@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Sagi Shahar <sagis@google.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>
Content-Type: text/plain; charset="UTF-8"

Define kvm_x86_ops .link_external_spt(), .set_external_spte(), and
.free_external_spt() as RET0 static calls so that an unexpected call to a
a default operation doesn't consume garbage.

Fixes: 77ac7079e66d ("KVM: x86/tdp_mmu: Propagate building mirror page tables")
Fixes: 94faba8999b9 ("KVM: x86/tdp_mmu: Propagate tearing down mirror page tables")
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm-x86-ops.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/include/asm/kvm-x86-ops.h b/arch/x86/include/asm/kvm-x86-ops.h
index de709fb5bd76..c18a033bee7e 100644
--- a/arch/x86/include/asm/kvm-x86-ops.h
+++ b/arch/x86/include/asm/kvm-x86-ops.h
@@ -94,9 +94,9 @@ KVM_X86_OP_OPTIONAL_RET0(set_tss_addr)
 KVM_X86_OP_OPTIONAL_RET0(set_identity_map_addr)
 KVM_X86_OP_OPTIONAL_RET0(get_mt_mask)
 KVM_X86_OP(load_mmu_pgd)
-KVM_X86_OP_OPTIONAL(link_external_spt)
-KVM_X86_OP_OPTIONAL(set_external_spte)
-KVM_X86_OP_OPTIONAL(free_external_spt)
+KVM_X86_OP_OPTIONAL_RET0(link_external_spt)
+KVM_X86_OP_OPTIONAL_RET0(set_external_spte)
+KVM_X86_OP_OPTIONAL_RET0(free_external_spt)
 KVM_X86_OP_OPTIONAL(remove_external_spte)
 KVM_X86_OP(has_wbinvd_exit)
 KVM_X86_OP(get_l2_tsc_offset)
-- 
2.53.0.rc1.217.geba53bf80e-goog

