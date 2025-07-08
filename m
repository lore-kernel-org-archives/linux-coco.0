Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCB12DECB9
	for <linux-coco@lists.linux.dev>; Tue,  8 Jul 2025 14:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751983406; cv=none; b=d2yYOjk7/Ps9hCC0aOvjTEfrBw4VP56T0HJhfGgrdQCz6KTod2tkX6zRYL6NKPX93mfj4LgUTW02itMS/g5dGG/bSElK9EomNBz+HEXYZej2IFPofNhYG+rWssh8jgN0SHYgzKiYT7NBOz4KzTtGpFW/iqPGjvwIeuWH1TWOZc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751983406; c=relaxed/simple;
	bh=9mN3j5w/WhanXLJmPGv99RuH5uBAok/NIpeDA4C68WM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Vlv/pV9viH7Vwq8JMvnY++5LnpYAXUBQcZKV6gFVP/wR3CuNGhd7aZo8Cou+nQCwRbUFywG1I59maqF0Yu/k43FeysaLx790hyF7kvmwIzzkkwV6LcRbl+JVAUijSD3BYtBxCHUlA+NxVJoCof72NxYJzb8dlltASTvzsMT4oUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XuosK12t; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XuosK12t"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-74d15d8dcd1so1566750b3a.2
        for <linux-coco@lists.linux.dev>; Tue, 08 Jul 2025 07:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751983405; x=1752588205; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=o4TP3MVwCYsQfm63LlH4AY1HFy9SyPnOqHfyHcIbkRw=;
        b=XuosK12tZpm2cEZjBWZzbdGdN+Cn3IyEi9yGPcc5NRUQZ+LJysb6dJnppZ2Tm2D4yC
         Y/lyqFuYXDQtAssgj1IzbLN7NpkTE02E3yhhPrJV1Hk5sL1vYOF8a2DOGPJ2vkOj3bFk
         Fm4n04OvOSDL7KgvpB86AWzcywUISzpTqvzRhbLVMsoCyiSRmtosk14y7wXMEG+yJHsU
         L0hmV1JLADmlA6NSr8TOiYJmlXZRqV0tn9Kt7KBPVWwzQHfX65uQAwfDXTLzQZqx2Q7h
         g+xSXufprO4hCyPfs+GVeKfITlWE94ddxbS8kC6Qu1M4FmBsNWICp+4VRMwY4r/FlnIm
         xEXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751983405; x=1752588205;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o4TP3MVwCYsQfm63LlH4AY1HFy9SyPnOqHfyHcIbkRw=;
        b=XcLkE1b32NiA8mnvY8VhLrvoTGtfQIqK3aHFXHRSlJ+i2QxTrgkswc7dy5xlRlnlh8
         vyTdDS09JRyXWOWfTuT2gN1eTWEz1Jc8OyC34DPzWKZK3+k3NIsDcP2zorEdOxHMXOJg
         z88sdhO1/hFpy91r8B69YiJBWTi/vL4hLh4S2rJ6wYabiG5w4aPoA0Yd/mE5D/rk24PR
         3wV7FuoPU529SmWQ77/+QynJD4Xc/jlO8bj4XEBWkkW/TaGTb1iCiU//Wip1o3uH6cNw
         hNotWb0yfHjEfxGFseSLsj48xSkwBnVj/l8UNkmQtY9BT/nDL5VZsyFbM2Upjh4aev1W
         MUpg==
X-Forwarded-Encrypted: i=1; AJvYcCVoZGqGlePXlM/xqVn8926emqfCv2R5pAUlYn65146GN6hL5C8Ot3JvtmqWlepqeEJ0MtEJXSRNzRjm@lists.linux.dev
X-Gm-Message-State: AOJu0YxqS5iiWQL8cqFa7Q8nIAngIiab7TrpwA7H7HpgDtZZWWP3cjD4
	O0Z6PYSb5PWJgWT5HVZ+wTvoF5vCCbPXqJxgIOQhFnv+PSDhJqlgVgDUtIxLtNQVqPgmyzGk+eP
	pyzTGtA==
X-Google-Smtp-Source: AGHT+IHhf0HkxE+LtVIJ0wBjztLgVPk4SPAUyF3xH4hkIz8GrWIpjiNNDpNUIoTg8aYD8/s35/AvSLaSUEA=
X-Received: from pfbce13.prod.google.com ([2002:a05:6a00:2a0d:b0:746:1eb5:7f3e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3a20:b0:740:b5f9:287b
 with SMTP id d2e1a72fcca58-74ce8834008mr21999888b3a.1.1751983404793; Tue, 08
 Jul 2025 07:03:24 -0700 (PDT)
Date: Tue, 8 Jul 2025 07:03:23 -0700
In-Reply-To: <20250708080314.43081-3-xiaoyao.li@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250708080314.43081-1-xiaoyao.li@intel.com> <20250708080314.43081-3-xiaoyao.li@intel.com>
Message-ID: <aG0lK5MiufiTCi9x@google.com>
Subject: Re: [PATCH 2/2] KVM: TDX: Remove redundant definitions of TDX_TD_ATTR_*
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, kvm@vger.kernel.org, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, rick.p.edgecombe@intel.com, Kai Huang <kai.huang@intel.com>, 
	binbin.wu@linux.intel.com, yan.y.zhao@intel.com, reinette.chatre@intel.com, 
	isaku.yamahata@intel.com, adrian.hunter@intel.com, tony.lindgren@intel.com
Content-Type: text/plain; charset="us-ascii"

On Tue, Jul 08, 2025, Xiaoyao Li wrote:
> There are definitions of TD attributes bits inside asm/shared/tdx.h as
> TDX_ATTR_*.
> 
> Remove KVM's definitions and use the ones in asm/shared/tdx.h
> 
> Reviewed-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
> ---
>  arch/x86/kvm/vmx/tdx.c      | 4 ++--
>  arch/x86/kvm/vmx/tdx_arch.h | 6 ------
>  2 files changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> index c539c2e6109f..efb7d589b672 100644
> --- a/arch/x86/kvm/vmx/tdx.c
> +++ b/arch/x86/kvm/vmx/tdx.c
> @@ -62,7 +62,7 @@ void tdh_vp_wr_failed(struct vcpu_tdx *tdx, char *uclass, char *op, u32 field,
>  	pr_err("TDH_VP_WR[%s.0x%x]%s0x%llx failed: 0x%llx\n", uclass, field, op, val, err);
>  }
>  
> -#define KVM_SUPPORTED_TD_ATTRS (TDX_TD_ATTR_SEPT_VE_DISABLE)
> +#define KVM_SUPPORTED_TD_ATTRS (TDX_ATTR_SEPT_VE_DISABLE)

Would it make sense to rename KVM_SUPPORTED_TD_ATTRS to KVM_SUPPORTED_TDX_ATTRS?
The names from common code lack the TD qualifier, and I think it'd be helpful for
readers to have have TDX in the name (even though I agree "TD" is more precise).
