Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483B633CE81
	for <linux-coco@lists.linux.dev>; Tue,  4 Nov 2025 17:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762278958; cv=none; b=jiOed2E84oObw40PS7dIfst9HHJ8ZtbZYLeD1OewVtzq2PbV5nI6PXQoqvC6x4Ddf+NN9w3T1IYfWSTE6/r3eDxj1zPpfaCyuGOaPqQDq1Y880KpVdopTPalsniJq8phjfR7DPPs+eAEE86rWbcncSghPP4vh2RUbzkPhsu1IuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762278958; c=relaxed/simple;
	bh=BUYcGl9NZGpuOAWhoQj8GR5JI856Kts3SQBxJmzRUIM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tZJAARmXmuPQo9ayT5ay9Ofad7I1W0fA0Thd5A7XXlsDRNK643eJ2Aynxoh4G1EmtVodk8pufEImFO+o8Njdo+u2hVsiclwebNQthwVH5jkl3S2+Tu0UXyNRhu74MLry52jqB77YGgSSz39rqSnGL08jQLBhznAjobEVtk4ThcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ff8L/jg4; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ff8L/jg4"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-286a252bfbfso142441205ad.3
        for <linux-coco@lists.linux.dev>; Tue, 04 Nov 2025 09:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762278957; x=1762883757; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HabTony5q8jGMwRLhhSbUAct1TYC0rmzBuxU6atPXUo=;
        b=Ff8L/jg4zhgxwYgALPeXLh7ZNJOKE3IzykrEQluULYnmd16SUq34A+32R+eET2YFnN
         GgpPjBqYrC3siEQ+XIoXLW2gRAUTIQZk17AY+qkyNKmqdtyE302rM+8cC6iIDXubaDQ0
         sLGS6C6fyR+MwQ0HbMIUPaL7JDGAmlgsVToXzxxXLKljR43Whn5YDjHkWJ2AAEuDv23V
         dJztGgcDC0fOl6J7+SQAdwZfUZCNBm8HG41x3l7iqrQolimgSj2g2kI8uME+17Z4A7DM
         Rk3fD2IC7Nr5COvO5FKgmTgZXMC45SHbUWkC0MUFGfWmfO2D1IbXn+dcd83u/lHK6qMv
         ABBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762278957; x=1762883757;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HabTony5q8jGMwRLhhSbUAct1TYC0rmzBuxU6atPXUo=;
        b=J0xHGiVQsoJ59yAK+5bRgifrGr0mYCJX6UJRhWGhQVvDi7nizatC8z8Ha+8PLJPfCC
         LK5KmtujaYoIsw6O6PBlwmVL58udMw/9KFT5SsHpaHik1ML8AoDaAdrGWmZdr+vAIY90
         jx82Hq/hDAGLfEe2bPt8LItxaUW5drSDcTJHcabuJnaKy78XtxcwjbjMfzLHsjkHLJYc
         o+c/lDNn6BE46Bi+ZXB7ewFLf+SBks90OqBWT3/sp9Q047huWsevP8wkukZMg+Q/t0HX
         e3vyGgJs41Q/a2o4GZjhrtO5Mq/UlCV6fH99kAWKxyMQN7B4fzGevkFy4N2FDBlU7L09
         /cJQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0shHezeGhDO5egiN9F3BgmJcnIjtmsOOAuczvn5660u1uNYFtpYrnBWxgFughGDmgI/hC3fe+QxDQ@lists.linux.dev
X-Gm-Message-State: AOJu0YwwZod03X838RxBgZTH6SztFWWj9Nrmgi4h2Ef46cNRi2JT8F1z
	Az0fWXGUHxVD7OuN9A+b64uZmU8CIlAKrm4Z/Pa5K0rv6oRBl16sxQbtl1yAfDs60VUUyddGIDm
	VZRHj3w==
X-Google-Smtp-Source: AGHT+IGCC3k5DOGjKU381UnrWK5meBDp0CQEAkWKfU/p8BnI8t61V9nT/piCEqlmbyG4yA03Pg0rxUssPWM=
X-Received: from plbkf3.prod.google.com ([2002:a17:903:5c3:b0:295:fb8:7fb1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f550:b0:295:68df:da34
 with SMTP id d9443c01a7336-2962ae56047mr5899775ad.53.1762278956590; Tue, 04
 Nov 2025 09:55:56 -0800 (PST)
Date: Tue, 4 Nov 2025 09:55:54 -0800
In-Reply-To: <aQnH3EmN97cAKDEO@yzhao56-desk.sh.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251030191528.3380553-1-seanjc@google.com> <20251030191528.3380553-2-seanjc@google.com>
 <aQhJol0CvT6bNCJQ@yzhao56-desk.sh.intel.com> <aQmmBadeFp/7CDmH@yzhao56-desk.sh.intel.com>
 <969d1b3a-2a82-4ff1-85c5-705c102f0f8b@intel.com> <aQnH3EmN97cAKDEO@yzhao56-desk.sh.intel.com>
Message-ID: <aQo-KhJ9nb0MMAy4@google.com>
Subject: Re: [PATCH v5 1/4] KVM: TDX: Explicitly set user-return MSRs that
 *may* be clobbered by the TDX-Module
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	"Kirill A. Shutemov" <kas@kernel.org>, kvm@vger.kernel.org, x86@kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Hou Wenlong <houwenlong.hwl@antgroup.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, Nov 04, 2025, Yan Zhao wrote:
> On Tue, Nov 04, 2025 at 04:40:44PM +0800, Xiaoyao Li wrote:
> > On 11/4/2025 3:06 PM, Yan Zhao wrote:
> > > Another nit:
> > > Remove the tdx_user_return_msr_update_cache() in the comment of __tdx_bringup().
> > > 
> > > Or could we just invoke tdx_user_return_msr_update_cache() in
> > > tdx_prepare_switch_to_guest()?
> > 
> > No. It lacks the WRMSR operation to update the hardware value, which is the
> > key of this patch.
> As [1], I don't think the WRMSR operation to update the hardware value is
> necessary. The value will be updated to guest value soon any way if
> tdh_vp_enter() succeeds, or the hardware value remains to be the host value or
> the default value.

As explained in the original thread:  

 : > If the MSR's do not get clobbered, does it matter whether or not they get
 : > restored.
 : 
 : It matters because KVM needs to know the actual value in hardware.  If KVM thinks
 : an MSR is 'X', but it's actually 'Y', then KVM could fail to write the correct
 : value into hardware when returning to userspace and/or when running a different
 : vCPU.

I.e. updating the cache effectively corrupts state if the TDX-Module doesn't
clobber MSRs as expected, i.e. if the current value is preserved in hardware.

> But I think invoking tdx_user_return_msr_update_cache() in
> tdx_prepare_switch_to_guest() is better than in
> tdx_prepare_switch_to_host().
> 
> [1] https://lore.kernel.org/kvm/aQhJol0CvT6bNCJQ@yzhao56-desk.sh.intel.com/
>  
