Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E78D4E379B
	for <linux-coco@lists.linux.dev>; Thu, 24 Sep 2026 21:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790286915; cv=none; b=ECF7prClYZ1ep22BMOwycsEaqMZTYGJ+BlSJqrK/8TAEh9PUgGEiBDli7mtmg2ScdgwJOSaCBLMOSQF1fj9y/+IXc3KHtUVoPKUcsxdO0oqGRce7axAOl7JaPxv+RUIlnxb/fTX1AdRfzZQyG6I5SyqLP6SZGnrKJS/rr2pBwX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790286915; c=relaxed/simple;
	bh=AmAFroaXL17QSnFsH/PQWr/UvsxMnLiTjSzJHT5lPFw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=n886f6Fp8NsfYvCw/CzQOlZQ0HTkiM5/O5t9ol2JM9YKp40nXxy1sCCVrCvVmxfsDgzllReRUijtu22ZOhuRWDBaIPmVpyB/y6fgOamvNdE8oPSlMb8oqjU2umgAolPFNKVsT82waC1C6DhO1sVh+Gnwj3IYa60barLGqvYGX1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GHsYHx4x; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GHsYHx4x"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbb92868263so149421a12.2
        for <linux-coco@lists.linux.dev>; Thu, 24 Sep 2026 14:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790286914; x=1790891714; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ezHhSJt+7qSkRvAzEm8z+BVF8AxbcHuofPSZIn2ErA4=;
        b=GHsYHx4xTS8/mBY7utJbC0+7nq5JuOzm5KZWk7uEwEKpNkGVCLRXP1/QVIHPVZPvy5
         lJX3SfGCrV9BNzBo3Dinv/WDHIoiOgvhwpNQqeR/kzE9Sc+OpH4B6Mp6KBXqxg8ZoAz6
         1Z2LEArLMUWt8wfC9QFzfIlv4Jt5jfSXShl+qaLVp41kDRMtdEigMvhNDAdtRCCnU4wv
         wtB/XW/QfxA14flJisV2rOFT3jVUhxn1dEnyNfn8gHgM2G/42tELkAYhXnJ/BMw2vdel
         P0PZXOjXVR9GFkLY3mvSwt6dC8a6hkqSPXf8AQwkGfq26cxojuBErqE6GCLQrhFi/4vk
         GnIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790286914; x=1790891714;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ezHhSJt+7qSkRvAzEm8z+BVF8AxbcHuofPSZIn2ErA4=;
        b=SqXGU74WN+cbG1rinTfpvL86G06hNpicfPjZyt+7fL9mi+erelsZ6WZJm8iXVkygB2
         5a1MPH6ffzPnjdPv/9JIJ52TQfU/9LGWE8X55qbI8XEyT5A/pzcvqeLiSmogUVj25Xt1
         KvtFuHpLnu10BKE6Cx4lceVwWfHB/PtiSJvECElqppw1kUIO1y4zTiy4TXuyV7+zKQ1v
         D9vQ+nN/CueWAtLAFXo2rqyuJG16xPtgVSnSeFQ1BPajskhnfKHioKNcc0WHxmnFSDim
         k5kBDHyyZ37gT/lzUrAL7x2RDLvkLJQ1JpPs8v6yTYhAB/t+r/RTjKekj0oXo1UN+6GJ
         FL/Q==
X-Forwarded-Encrypted: i=1; AKwUvByksCC4zZBUypODN9QYRfEozKlRHNcJ+StbFY1u0IzYG0GtaBm7GB5lZ3b7JqBIdlzD94/Mr9uNoZGN@lists.linux.dev
X-Gm-Message-State: AFuF++mqUqG2o4J+KXmL4KHggbC2eOeqrCdl3SlWFIBBU6GOfZz8IV5M
	nUtbLBf31KxpVPznBNrwGPmH7NH53Cq3Ulkuhw9B4hRVvCHp5a1pfu0L9DNtw29Kh2MAv/wue+D
	wNFqk/g==
X-Received: from pgte15.prod.google.com ([2002:a65:688f:0:b0:cc7:80f9:3931])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:2d21:b0:3dd:a196:30a6
 with SMTP id adf61e73a8af0-3de0e9b22f2mr3581598637.86.1790286913447; Thu, 24
 Sep 2026 14:55:13 -0700 (PDT)
Date: Thu, 24 Sep 2026 14:52:09 -0700
In-Reply-To: <20260819094903.3060020-1-xiaoyao.li@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260819094903.3060020-1-xiaoyao.li@intel.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <179028366994.2006772.3458650384627466944.b4-ty@b4>
Subject: Re: [PATCH v4 0/9] KVM: TDX: Enable VM-DoS Prevention Features for TDX
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	nik.borisov@suse.com
Content-Type: text/plain; charset="utf-8"

On Wed, 19 Aug 2026 17:48:54 +0800, Xiaoyao Li wrote:
> This is v4 of the series to enable the Notify VM Exit and Bus Lock VM
> exit for TDX, which fixes the KVM CAP issue related with them and allow
> userspace to actually enable the features.
> 
> Compared to v3, this v4 adds 5 more patches.  The first 8 patches target
> for stable kernels while only the patch 9 doesn't have to.  Patch 1 is a
> single patch to enable Notify VM exit for TDX.  Except patch 6, patch
> 2-7 are mandatory for enabling Bus Lock VM exit for TDX in patch 8.
> 
> [...]

Applied to kvm-x86 vmx, thanks!

[1/9] KVM: TDX: Enable Notify VM exit
      https://github.com/kvm-x86/linux/commit/d93395058c19
[2/9] KVM: TDX: Check if there is valid exit infos based on vp_enter_ret
      https://github.com/kvm-x86/linux/commit/0966c881ea13
[3/9] KVM: TDX: Set bits 31:16 to 0 for the synthesized Exit Reason
      https://github.com/kvm-x86/linux/commit/b43c520b198a
[4/9] KVM: TDX: Don't assume exit_reason[31:16] is all-0 in tdx_to_vmx_exit_reason()
      https://github.com/kvm-x86/linux/commit/bc335ce04408
[5/9] KVM: TDX: Update exit_reason on wait_for_sept_zap return
      https://github.com/kvm-x86/linux/commit/e5f1d62c59ae
[6/9] KVM: VMX: Preserve negative return value in vmx_handle_exit() with bus lock detected
      https://github.com/kvm-x86/linux/commit/cef48693da1e
[7/9] KVM: VMX: Make handle_bus_lock_vmexit() a shared helper
      https://github.com/kvm-x86/linux/commit/326fa2c9b4d3
[8/9] KVM: TDX: Enable Bus Lock VM exit
      https://github.com/kvm-x86/linux/commit/63d196e2e204
[9/9] KVM: VMX: Consolidate the exit handler for VMX and TDX
      https://github.com/kvm-x86/linux/commit/213bbf18f07a

--
https://github.com/kvm-x86/linux/tree/next
