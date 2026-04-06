Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952F738F62D
	for <linux-coco@lists.linux.dev>; Mon,  6 Apr 2026 22:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775514574; cv=none; b=KueGiyW4iZ4GzC9vXy4UVZf4qaobR2ybJQuTx7wH828VxqakqA8gllIq1Gs9fLmwwfQoH7RBDeNyZQkBCp71VRPSVcXKBPmH3W/g/V3H8hsoHI9nn6rhnyE9/M9SsCu9WxisKwuejIdDnPqqUYdQzzI4DCPNHS+1vcIZsXJF8fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775514574; c=relaxed/simple;
	bh=D3KOeP/lm1TkbZwNyXgjGb/xIk25CQwDhpR6K8Yljzk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=S47UB5cAuZNyIyF4KffLJnfz348Ami7wAHHE3Vx7vAOR9Lqjiezy2Gq00r9TBdRFC3YCUDgMV6TXw6A3x0HAM0TjtxKpgSq7UHMF6db3lc1K3YGDNNwdDXMiFH56LFLehauk4BD6OivYrYgpJq5mvvrOn1MX/Ywol86QtfEud4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YlLddwJv; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YlLddwJv"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-35d9010602bso4485922a91.3
        for <linux-coco@lists.linux.dev>; Mon, 06 Apr 2026 15:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775514573; x=1776119373; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1Mq8leRxD41dHOGYa35vjH2K0hrW+lX252WdYaTg5Xs=;
        b=YlLddwJvk4+a9GSIaItx0Zo7gxKErC/A/DgzZsBNo7BIEu2bCpZxMhjWeuLCajN9vE
         S6srSXmEfCTy63zTR6YEn1jBT+/EdLevKcgM9cuYFZX6Dd4Z8bGeF2gg8Pd3myrzItsk
         1TvqH/Y0MMjkaofiQWpxEObd7WZTo6XtYzHq+6Ia1oXxRL5asVyG8JvbpBrKJu1Go5Dn
         fxMA9r3tOQjXnfGGYGWySjPT2aMxmQdJQofglf2I3Q9m7yNA0SaYzSisemjW7gN1X8zG
         GrtY6Bila7cm4gFnZu+Q2z0qvk0ZiWoKiEYvOj6DJ0Akst8v/3qvPjSQIN8RmuIYUx5e
         JARQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775514573; x=1776119373;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Mq8leRxD41dHOGYa35vjH2K0hrW+lX252WdYaTg5Xs=;
        b=WOw6F3vhchW0MHFMKq5h8jS+0Gfd+Vl7gLETPc+4Vw8GJC47iVeBBTeb2QBuUy4V8e
         0FIgIy8t/IIDYnsvXOrVfDrBvza2BiJOr2JwVj3h89M2GnIsyVkKFVeQIm1gzvTGefWv
         MtkPcGnNUgdiM5JQRvVwJK1SJ2lwJF58nn0vn0WCXM1LBxf2OQ89+Mb3DyapcCvUy+zt
         nqzLr6RitA6ZnXuehyxrUmU4ntAuvUuaq9GV2SSZSxBkGpRxKh5vE4r+uFBIqYMhsr8c
         Y4mVnbrrm8T4iS8SlviDrFGqGYZ8GIKtiEgyudCIMLcX3ya+Spu846mMuGKe6KH69OCx
         w73A==
X-Forwarded-Encrypted: i=1; AJvYcCXECGhyNN/Bs0Oih+KSBV1ziOy1HXroams6uEUhvFFvE+7QfclPNhrWKHpQOx1ax/OAgn2A7Lmaw19I@lists.linux.dev
X-Gm-Message-State: AOJu0YwNMcbkrLbZLz7ZsBv+mZWXUCtZ0zjmYEyyJwv9Ra5cGn2oUB8d
	EBlS2F3At6rkzuodCZuMAbQDE8bf8PPD1J4hYlw7nHpdJoTzgyoCy79LR4hLCEW1Yl7oqUosn9t
	6GoNZ2g==
X-Received: from pgac12.prod.google.com ([2002:a05:6a02:294c:b0:c76:98c9:d80a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3f08:b0:35d:997c:8eb8
 with SMTP id 98e67ed59e1d1-35de697d01bmr12921654a91.24.1775514572748; Mon, 06
 Apr 2026 15:29:32 -0700 (PDT)
Date: Mon, 6 Apr 2026 15:29:31 -0700
In-Reply-To: <20260331124214.117808-18-chao.gao@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260331124214.117808-1-chao.gao@intel.com> <20260331124214.117808-18-chao.gao@intel.com>
Message-ID: <adQzy1-FIwDiuGAP@google.com>
Subject: Re: [PATCH v7 17/22] x86/virt/tdx: Avoid updates during
 update-sensitive operations
From: Sean Christopherson <seanjc@google.com>
To: Chao Gao <chao.gao@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	kvm@vger.kernel.org, binbin.wu@linux.intel.com, dan.j.williams@intel.com, 
	dave.hansen@linux.intel.com, ira.weiny@intel.com, kai.huang@intel.com, 
	kas@kernel.org, nik.borisov@suse.com, paulmck@kernel.org, pbonzini@redhat.com, 
	reinette.chatre@intel.com, rick.p.edgecombe@intel.com, sagis@google.com, 
	tony.lindgren@linux.intel.com, vannapurve@google.com, 
	vishal.l.verma@intel.com, yilun.xu@linux.intel.com, xiaoyao.li@intel.com, 
	yan.y.zhao@intel.com, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, Mar 31, 2026, Chao Gao wrote:
> A runtime TDX module update can conflict with TD lifecycle operations that
> are update-sensitive.
> 
> Today, update-sensitive operations include:
> 
> - TD build: TD measurement is accumulated across multiple
>   TDH.MEM.PAGE.ADD, TDH.MR.EXTEND, and TDH.MR.FINALIZE calls.
> 
> - TD migration: intermediate crypto state is saved/restored across
>   interrupted/resumed TDH.EXPORT.STATE.* and TDH.IMPORT.STATE.* flows.
> 
> If an update races TD build, for example, TD measurement can become
> incorrect and attestation can fail.
> 
> The TDX architecture exposes two approaches:
> 
> 1) Avoid updates during update-sensitive operations.
> 2) Detect incompatibility after update and recover.
> 
> Post-update detection (option #2) is not a good fit: as discussed in [1],
> future module behavior may expand update-sensitive operations in ways that
> make KVM ABIs unstable and will break userspace.
> 
> "Do nothing" is also not preferred: while it keeps kernel code simple, it
> lets the issue leak into the broader stack, where both detection and
> recovery require significantly more effort.
> 
> So, use option #1. Specifically, request "avoid update-sensitive" behavior
> during TDX module shutdown and map the resulting failure to -EBUSY so
> userspace can distinguish an update race from other failures.
> 
> When the "avoid update-sensitive" feature isn't supported, proceed with
> updates. If a race occurs between module update and update-sensitive
> operations, failures happen at a later stage (e.g., incorrect TD
> measurements in attestation reports for TD build). Effectively, this
> means "let userspace update at their own risk". Userspace can check if
> the feature is supported or not. The alternative of blocking updates
> entirely is rejected [2] as it introduces permanent kernel complexity to
> accommodate limitations in early TDX module releases that userspace can
> handle.
> 
> Note: this implementation is based on a reference patch by Vishal [3].
> Note2: moving "NO_RBP_MOD" is just to centralize bit definitions.
> 
> Signed-off-by: Chao Gao <chao.gao@intel.com>
> Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
> Link: https://lore.kernel.org/linux-coco/aQIbM5m09G0FYTzE@google.com/ # [1]
> Link: https://lore.kernel.org/kvm/699fe97dc212f_2f4a100b@dwillia2-mobl4.notmuch/ # [2]
> Link: https://lore.kernel.org/linux-coco/CAGtprH_oR44Vx9Z0cfxvq5-QbyLmy_+Gn3tWm3wzHPmC1nC0eg@mail.gmail.com/ # [3]
> ---

For the STATUS_MASK movement:

Acked-by: Sean Christopherson <seanjc@google.com>

> ---
>  arch/x86/include/asm/tdx.h   | 11 +++++++++--
>  arch/x86/kvm/vmx/tdx_errno.h |  2 --
>  arch/x86/virt/vmx/tdx/tdx.c  | 25 +++++++++++++++++++++----
>  arch/x86/virt/vmx/tdx/tdx.h  |  3 ---
>  4 files changed, 30 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
> index 79733fdb35c6..00751506dd3c 100644
> --- a/arch/x86/include/asm/tdx.h
> +++ b/arch/x86/include/asm/tdx.h
> @@ -26,11 +26,18 @@
>  #define TDX_SEAMCALL_GP			(TDX_SW_ERROR | X86_TRAP_GP)
>  #define TDX_SEAMCALL_UD			(TDX_SW_ERROR | X86_TRAP_UD)
>  
> +#define TDX_SEAMCALL_STATUS_MASK		0xFFFFFFFF00000000ULL
> +

...

> diff --git a/arch/x86/kvm/vmx/tdx_errno.h b/arch/x86/kvm/vmx/tdx_errno.h
> index 6ff4672c4181..215c00d76a94 100644
> --- a/arch/x86/kvm/vmx/tdx_errno.h
> +++ b/arch/x86/kvm/vmx/tdx_errno.h
> @@ -4,8 +4,6 @@
>  #ifndef __KVM_X86_TDX_ERRNO_H
>  #define __KVM_X86_TDX_ERRNO_H
>  
> -#define TDX_SEAMCALL_STATUS_MASK		0xFFFFFFFF00000000ULL
> -
>  /*
>   * TDX SEAMCALL Status Codes (returned in RAX)
>   */
