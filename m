Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5862EC0A7
	for <linux-coco@lists.linux.dev>; Thu, 15 Jan 2026 19:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768504643; cv=none; b=smJAQaYNpZ6TgHQ2mD59xIuXuXAVrhZxu3uSSTdjKAzzsGpotVZM4aGk+pGGAB+3qLXETehQJqLJsAClr+3Gqd1F9W0fIGJGLW3p9S4Do7bS4Py7s/bSsE3IHL/V+qEPQF6+XKQUWN6GddblVZK5p70rMWuqahPgIV6AhiCv8sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768504643; c=relaxed/simple;
	bh=8EsIAojX7izm3eUG0OWRmU4nt+cjKhAtCc3Rt+DkVVo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DJmlkqL9TKm2Iy1O1y9H2SedCQ8w9CnYOxheeHRv2scUdiQxBGB2vfXaHoUGKIpmaeQW2eIuotsqN4I9jcjbdPmET7gX/ISsoTgPzna+7GN3S98F43wSRdtWyQ35yBFURNR53EtOZU8GauoxOccG37qo6SX4mCjH0EiA3KuzZnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QU2re6XH; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QU2re6XH"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-81efa628efbso1068546b3a.1
        for <linux-coco@lists.linux.dev>; Thu, 15 Jan 2026 11:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768504640; x=1769109440; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xTgcZS4Su6Azzs6FTl7APd5b9i+AMlUEP5Ldeqc7RbI=;
        b=QU2re6XHdHStBsCnt7vTJutid87o7uoIlP1XoLaHTfxXlru+0Sggl+XRZ4Ghi/MfRe
         shDXGHrUi7Gw/O/u6nBvYQbAOJURjTWl3+nxIduWMv7KeSSm4X+tOzE0mT2s49kYiCYq
         Ocvq0bl8zaLl26WFGfgfvzsB+vMpm97o85yF0s5bkkTNdM1fpHmjin1E0BWnHl5KEGE5
         ORB4ihZDbB4Tuqvzbh2dT1XPeQ1eC0rjQ6sIGT66OQAVLrXLcoCG1SdenPX0bP4LARgv
         RqQ+cQpc5IKbe127TI5F677Qg2+CK9nL4alcI6mvjgcmqY54YL4o9GvWYr6f+OewO33g
         BSAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768504640; x=1769109440;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xTgcZS4Su6Azzs6FTl7APd5b9i+AMlUEP5Ldeqc7RbI=;
        b=FgFlEluyf/dDI9lqyW3CyWjanPUfJhG/RxQHM2e3ln9itgnigNFqK3ZikWNxdO14hc
         kIIlRz1HPahLcRgY64WWvZcwJX/43MSmXrL+00mW+Kb8LLWUp64xFVi3N08MofSjad1n
         HoMv4XlU7TmvDNvRMatXIEi2KHXIqqA+cmTMuTw5RG/hN2Lo+897dtvU4TsKh7P9qa6w
         lBrr0KF6m0nJr5S1Q+ih4d2Z8IxD6ve6NhwxCB3TGAZyosdIDYw3+XMDhSMT0vy8uzrR
         IVY+WirE0oSfBmComyaD9gpcsTGSmjFY9xdWcXinHGBtoWvH+R2X/fo4RQ/y9FhVGznR
         dVbw==
X-Forwarded-Encrypted: i=1; AJvYcCUO9M3o+Z0SurRMBJPpru2P4inmTihoOExR2138RLUIYcveLpasi+962kgDQcupkccm85UqbEMVxzU6@lists.linux.dev
X-Gm-Message-State: AOJu0YxPvlUEiXC3n5fgys/kVAWR5KsIovZGwm2/zqP1CSDFLFZzYHaG
	AaOrqhliD6t8Uz+aT8VWpGIPapApZhaMHRkoCLcPEGzzQcAY9UG/v7cMCbg6q/xM30BJMvn3K0i
	j8lNVhw==
X-Received: from pfbbj16.prod.google.com ([2002:a05:6a00:3190:b0:7b8:922c:725d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2ea0:b0:81f:3d13:e070
 with SMTP id d2e1a72fcca58-81fa17729e5mr189167b3a.12.1768504640018; Thu, 15
 Jan 2026 11:17:20 -0800 (PST)
Date: Thu, 15 Jan 2026 11:17:18 -0800
In-Reply-To: <20260108214622.1084057-3-michael.roth@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260108214622.1084057-1-michael.roth@amd.com> <20260108214622.1084057-3-michael.roth@amd.com>
Message-ID: <aWk9PusYNW0iADuD@google.com>
Subject: Re: [PATCH v3 2/6] KVM: guest_memfd: Remove partial hugepage handling
 from kvm_gmem_populate()
From: Sean Christopherson <seanjc@google.com>
To: Michael Roth <michael.roth@amd.com>
Cc: kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, thomas.lendacky@amd.com, pbonzini@redhat.com, 
	vbabka@suse.cz, ashish.kalra@amd.com, liam.merwick@oracle.com, 
	david@redhat.com, vannapurve@google.com, ackerleytng@google.com, aik@amd.com, 
	ira.weiny@intel.com, yan.y.zhao@intel.com, pankaj.gupta@amd.com, 
	Kai Huang <kai.huang@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Thu, Jan 08, 2026, Michael Roth wrote:
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index fdaea3422c30..9dafa44838fe 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -151,6 +151,15 @@ static struct folio *kvm_gmem_get_folio(struct inode *inode, pgoff_t index)
>  					 mapping_gfp_mask(inode->i_mapping), policy);
>  	mpol_cond_put(policy);
>  
> +	/*
> +	 * External interfaces like kvm_gmem_get_pfn() support dealing
> +	 * with hugepages to a degree, but internally, guest_memfd currently
> +	 * assumes that all folios are order-0 and handling would need
> +	 * to be updated for anything otherwise (e.g. page-clearing
> +	 * operations).
> +	 */
> +	WARN_ON_ONCE(folio_order(folio));

Gah, this is buggy.  __filemap_get_folio_mpol() can return an ERR_PTR().  If that
happens, this WARN will dereference garbage and explode.

And of course I find it _just_ after sending thank yous, *sigh*.

I'll squash to this (after testing):

	WARN_ON_ONCE(!IS_ERR(folio) && folio_order(folio));

avoiding a few emails isn't worth having a lurking bug.
