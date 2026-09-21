Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CEA144C50E
	for <linux-coco@lists.linux.dev>; Mon, 21 Sep 2026 23:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790034693; cv=none; b=RoLtWEsBbnWZf1FdaTTjjaKtHfftMQfv4f1KEZLjSVvttX0QVLENKACl0KsmZJBTeipx0h9YfKgr6lgItbTF0eBlsIeA467H5VI9rHY0Tuff6mR3yWU3EJ9oWQjASfeW1ehO9nxDbZgm6fSL57pIkmm7zB9MiqUlng51hbSfX7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790034693; c=relaxed/simple;
	bh=QyoiVlZcrQw2NA0GB/xs5L1XT1cKTuYk0POnS93O920=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BGJipNDAjqKzoi6KVVhihzgYw+aD/bCbUoE46iw5VjNZnSibfi1ldZAgCnQP2nmtyNbPonGOb8lVHUVcvtpIKGH5LijYs7Pc/Wi4iopY0+SBFsJB3DHPm5CphzCDrmoWv3+XfXrU17rASg42xPmSrRvtkY4tWY4PObvp2PxjFxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oFNIe/we; arc=none smtp.client-ip=209.85.210.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oFNIe/we"
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-877ef1457aeso2745435b3a.1
        for <linux-coco@lists.linux.dev>; Mon, 21 Sep 2026 16:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790034692; x=1790639492; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IVY/bA9ZpCCgCbVJoTStyY4rkPplmsI1qX0ZCCDfam4=;
        b=oFNIe/weITTYoMHPB6LGjHffkaAmbOD/oYkvcjmmVBfjzan4bjeuvbvc+1YlBqImyW
         z9gCCbk8mNcaYxiBRyJ6eXoI0NK7EhHsBblOH/2hopDY4fnMCmw8GP87Z+QqYtC++dcu
         vzDmNVoOJd2lbk3pj41SCELycEQwHdc2pNsg//WUXpXhBMYi9Hz3wkpgrxb82Jl2VTtW
         07GWfAePP5EVgrnMyhj5BHkYaqRQPIFkYsf5K+oenNvZAq3uRkuspeJZbghgo5t7ft3k
         9gyxDUGwczPM8qOsnKiDCIsRBPQ7K7PKQ3xD0UJrFqigBKeCzenD/NnRFibINILf7oTC
         SN+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790034692; x=1790639492;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IVY/bA9ZpCCgCbVJoTStyY4rkPplmsI1qX0ZCCDfam4=;
        b=bvTKhMEeLT8oMAvvmQ/O8QVuBNuBui5PT20ydy4XIgJH6tG7I4pCF6uKti1xku68+2
         GYjDEwtI8WUwQVH4gsSmCsNQ01hRL6F8sC0rKN7DcJPKnHjnuQtSgMsXtFA41jB7tPQR
         emNsNTqPNXVxLK7HCHdKXS6KeRUQcjvEnuBKYmoovjKffzZ2GWAeOOqE1C6qxDtG9IDp
         TlYuCXzeWf9Q0W60KnYQSBcs9NA1B3uxXY2FGWaWti/59+OPj4XYc6QvJunxFYXgIIya
         NDQC/zpHMG4a8UUUpYpKG9Fi7OdfxsljsLLAauPYP/L550bEq4l1pxUMd+simjl8Otip
         b95A==
X-Forwarded-Encrypted: i=1; AKwUvBwxqZiC3lpKNbMKaS/6VX6NHynDE0GVo1WH7h4s/eF5qFQgqN5Eh3IZS9eT7Dia2Ta66SzdhXaudHxg@lists.linux.dev
X-Gm-Message-State: AFuF++lPUpv20Fu+bveTF8n8sm6aOmCo1eTLequTJGf6Kibszg5yljKS
	3tGCBxHFOfaRgzXH2GLnpQwH3Y9XHMxU3stZOYA576m7GNJlif2QLHCiGgY858opeFqH1Dk3xTe
	XIwj+eQ==
X-Received: from pfj9.prod.google.com ([2002:a05:6a00:a409:b0:87a:ae70:87c9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:94fc:b0:871:b921:6f44
 with SMTP id d2e1a72fcca58-874dbcec5e1mr15279859b3a.12.1790034691298; Mon, 21
 Sep 2026 16:51:31 -0700 (PDT)
Date: Mon, 21 Sep 2026 16:51:29 -0700
In-Reply-To: <6d9113d7-cfae-480b-908a-5cb52020a6c8@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260819094903.3060020-1-xiaoyao.li@intel.com> <6d9113d7-cfae-480b-908a-5cb52020a6c8@intel.com>
Message-ID: <arHDAVhFXeQXXrfI@google.com>
Subject: Re: [PATCH v4 0/9] KVM: TDX: Enable VM-DoS Prevention Features for TDX
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	nik.borisov@suse.com
Content-Type: text/plain; charset="us-ascii"

On Mon, Sep 21, 2026, Xiaoyao Li wrote:
> On 8/19/2026 5:48 PM, Xiaoyao Li wrote:
> > Hi all,
> > 
> > This is v4 of the series to enable the Notify VM Exit and Bus Lock VM
> > exit for TDX, which fixes the KVM CAP issue related with them and allow
> > userspace to actually enable the features.
> > 
> > Compared to v3, this v4 adds 5 more patches.  The first 8 patches target
> > for stable kernels while only the patch 9 doesn't have to.  Patch 1 is a
> > single patch to enable Notify VM exit for TDX.  Except patch 6, patch
> > 2-7 are mandatory for enabling Bus Lock VM exit for TDX in patch 8.
> > 
> > Patch 6 itself is a fix for VMX and is OK for cc stable though maybe not
> > necessary.  Patch 6 is added to this series since it can help stop Sashiko
> > repeating its finding of VMX's pre-existing issue, and it's also necessary
> > for patch 9 to consilidate the exit handler for VMX and TDX.
> > 
> > There are other issues of existing code found during previous review, like
> > the EPT MISCONFIG handling.  Given they are not mandatory for enabling the
> > Notify VM exit and Bus Lock VM exit for TDX, the plan is to address them in
> > a follow-up series separately.
> > 
> > Please refer to v1 for a full background.
> > 
> > v3: https://lore.kernel.org/all/20260812080229.2481439-1-xiaoyao.li@intel.com/
> > v2: https://lore.kernel.org/all/20260810112200.2326727-1-xiaoyao.li@intel.com/
> > v1: https://lore.kernel.org/all/20260805031257.1844914-1-xiaoyao.li@intel.com/
> 
> Hi Sean,
> 
> What's your plan on this series? Can you queue it if it looks good to you? Or
> need me to spin a new version to address Binbin and Rick's comments on the
> commit message?

Get it applied, with some tweaks.  I.e. no v5 necessary.
