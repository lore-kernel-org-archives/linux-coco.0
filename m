Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383B83E51C7
	for <linux-coco@lists.linux.dev>; Thu,  5 Mar 2026 17:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772730825; cv=none; b=WXbVwdY/J/m0zKWcY76UoIdhyt2t116uu1TC6tSzDAdItOQQ60YCNeSYkhkShegrwuZrqCR4JtLQqyr3RpnJwhhZXnuyJ0hldlfbS7mO9WHggP2IqZuqaisBC6HDPu1Z3gXMzNV2xPTDu/AnAwsjsVtmFVRu3ye23FArwKGjFrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772730825; c=relaxed/simple;
	bh=qHC00ISKgrMZfRY6dSld9netJgpoxAtIn0hM+5n3r7Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lH9pNJ060fs+rAbyqGOa+cXuanwTVDUvhsla1pZ6NAXi/PMrXxsD5Nggy3r3nRhHXYsE15TY9CRti9L0hVgx/ruK8fPh5vleP6ncv/YB3PfqtbNVX4VHZaWd1D1lOMVG/nuZuYbbQy0Y5vncOsK7om/2gKfzqZHs9rfKRYE5djg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lbEO8TEP; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lbEO8TEP"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-3568090851aso44920483a91.1
        for <linux-coco@lists.linux.dev>; Thu, 05 Mar 2026 09:13:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772730824; x=1773335624; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=E2bUC8Oe3NfU9TjoldHhqqoJKW3UcTrvlp0nRfSmBH0=;
        b=lbEO8TEPXGCmYYN+XcPbQlr/LznBx1FbX60aB+Fl/JvbyGFfNbUzceogo0R1nhyK46
         z46Yr+iGKMqTHTBCrJqOkOCrab9hK395fFXpmxedNEtDDhP2sQxcJ/Hkw5Y+SiwtMnJL
         y8xw1qL6qDCmIRpJqzrMTi8+DiQ3GjO1yU67eNqd3RgvLSGFU7UucjZSOOtrhD57e6nh
         u2q+2xzWXFduK+QGQcft/EAHTxvA+eOabdmYloojWQznghROrXFnuj9jmuIYywfk0az3
         J8yAbYKYDqK4ftk7RsOeQIE0JJZVGfJckOJymAIykv+PClbbm4ezodoqkN8ZGxy9G2i0
         ATTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772730824; x=1773335624;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E2bUC8Oe3NfU9TjoldHhqqoJKW3UcTrvlp0nRfSmBH0=;
        b=f8l17QoxYW3Fb2arQxf41BMg/8ZSyo6PDS4SxcP51AP2SZQ+XrBqD4LHOeXsLtwjSy
         Vm/CgD4C/quuAMNN3G3eKarPfHh4duqsmF33DuSw+lK8sLeTHq67gEJi7QcB/PZN5WNx
         j3O4rE9498CS2C6aMAg7N+yZE7lL53/a8y1xNFvwlm2UBBvrKe3xkGBFZ9s2kjcW1GWq
         DjfVx0N0s+sAd6ABK3cd9hmSHo2FsQ38oXpc0XD6FKPkSRGVW5j8b6778Wh0GvUh3UJf
         mhubl3v4hYqcWx1sUv/VTbSP1OAdopickF6ea7oTdD+KC675SkpZJdC3At2IZTuSpAWF
         bYhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBjYj76jGqwH9Qb74RAoPEj/z2fqMlo07AdAi+uDth18/FZBLHpu4z4iD3reGgrj3NEAnUbFAF8/47@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+4/1WwTcsaKM/TtO0qdPnBMqpZXGxgSzJ0K/u3tP3ai/GX/QG
	gw6kHIN7fokC5ixE7WlzxW9m5GHv8ksgReEDUPpE95ADGAqnidxaYMjyPds14REQRSukAIEUP3+
	J+6ZkFQ==
X-Received: from pjbms20.prod.google.com ([2002:a17:90b:2354:b0:359:8d4a:7276])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:388d:b0:359:8293:67f2
 with SMTP id 98e67ed59e1d1-359a6a7a05fmr4296177a91.32.1772730823229; Thu, 05
 Mar 2026 09:13:43 -0800 (PST)
Date: Thu,  5 Mar 2026 09:08:39 -0800
In-Reply-To: <20260214012702.2368778-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260214012702.2368778-1-seanjc@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <177272960351.1566277.2741684808536756847.b4-ty@google.com>
Subject: Re: [PATCH v3 00/16] KVM: x86/tdx: Have TDX handle VMXON during bringup
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	kvm@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Chao Gao <chao.gao@intel.com>, Xu Yilun <yilun.xu@linux.intel.com>, 
	Dan Williams <dan.j.williams@intel.com>
Content-Type: text/plain; charset="utf-8"

On Fri, 13 Feb 2026 17:26:46 -0800, Sean Christopherson wrote:
> Assuming I didn't break anything between v2 and v3, I think this is ready to
> rip.  Given the scope of the KVM changes, and that they extend outside of x86,
> my preference is to take this through the KVM tree.  But a stable topic branch
> in tip would work too, though I think we'd want it sooner than later so that
> it can be used as a base.
> 
> Chao, I deliberately omitted your Tested-by, as I shuffled things around enough
> while splitting up the main patch that I'm not 100% positive I didn't regress
> anything relative to v2.
> 
> [...]

Applied to kvm-x86 vmxon, with the minor fixups.  I'll make sure not to touch
the hashes at this point, but holler if anyone wants an "official" stable tag.

[01/16] KVM: x86: Move kvm_rebooting to x86
        https://github.com/kvm-x86/linux/commit/4059172b2a78
[02/16] KVM: VMX: Move architectural "vmcs" and "vmcs_hdr" structures to public vmx.h
        https://github.com/kvm-x86/linux/commit/3c75e6a5da3c
[03/16] KVM: x86: Move "kvm_rebooting" to kernel as "virt_rebooting"
        https://github.com/kvm-x86/linux/commit/a1450a8156c6
[04/16] KVM: VMX: Unconditionally allocate root VMCSes during boot CPU bringup
        https://github.com/kvm-x86/linux/commit/405b7c27934e
[05/16] x86/virt: Force-clear X86_FEATURE_VMX if configuring root VMCS fails
        https://github.com/kvm-x86/linux/commit/95e4adb24ff6
[06/16] KVM: VMX: Move core VMXON enablement to kernel
        https://github.com/kvm-x86/linux/commit/920da4f75519
[07/16] KVM: SVM: Move core EFER.SVME enablement to kernel
        https://github.com/kvm-x86/linux/commit/32d76cdfa122
[08/16] KVM: x86: Move bulk of emergency virtualizaton logic to virt subsystem
        https://github.com/kvm-x86/linux/commit/428afac5a8ea
[09/16] x86/virt: Add refcounting of VMX/SVM usage to support multiple in-kernel users
        https://github.com/kvm-x86/linux/commit/8528a7f9c91d
[10/16] x86/virt/tdx: Drop the outdated requirement that TDX be enabled in IRQ context
        https://github.com/kvm-x86/linux/commit/0efe5dc16169
[11/16] KVM: x86/tdx: Do VMXON and TDX-Module initialization during subsys init
        https://github.com/kvm-x86/linux/commit/165e77353831
[12/16] x86/virt/tdx: Tag a pile of functions as __init, and globals as __ro_after_init
        https://github.com/kvm-x86/linux/commit/9900400e20c0
[13/16] x86/virt/tdx: KVM: Consolidate TDX CPU hotplug handling
        https://github.com/kvm-x86/linux/commit/eac90a5ba0aa
[14/16] x86/virt/tdx: Use ida_is_empty() to detect if any TDs may be running
        https://github.com/kvm-x86/linux/commit/afe31de159bf
[15/16] KVM: Bury kvm_{en,dis}able_virtualization() in kvm_main.c once more
        https://github.com/kvm-x86/linux/commit/d30372d0b7e6
[16/16] KVM: TDX: Fold tdx_bringup() into tdx_hardware_setup()
        https://github.com/kvm-x86/linux/commit/f630de1f8d70

--
https://github.com/kvm-x86/linux/tree/next
