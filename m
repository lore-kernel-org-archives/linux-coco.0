Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF438372070
	for <linux-coco@lists.linux.dev>; Fri,  2 Oct 2026 09:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932531; cv=pass; b=Lk/W1DlUdnzKJed0viZV4ksmHWHsElX1pGfilzXA90llqJzC6bbVdfOC3rJ+OF1sGgGdB6RL6ZQN9UqZgssPqN28BAH5To9hhUWwXsoYKYpTxFPoqvFD5jV2ulc3d4AXCD3TjyUenIzcM9iM4EUh5sEsHgdfGZSahfDoAmiIvWM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932531; c=relaxed/simple;
	bh=hWB1QcQGFZjdtaZ+WkrO/eQNuOSYDk3BPt9FwXfnsYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Veelq2mfWIJL85YD8YU8XAJ6fruRVL5t98K4FjJ7VPPvEecjO9z4A8+6LBHtiEZv2rjXHigcrJXqFXib7cUatDL8f2iB3YeA9NijfrpjUkMQxv2H2TBfDw6zW5YuvfgH3fcWCfRuMcaTXdtm7uhDy6xzuT0Enrb/c8vyQzmHOJs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mHYz+cGJ; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mHYz+cGJ"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5ba4065fa07so6352e87.0
        for <linux-coco@lists.linux.dev>; Fri, 02 Oct 2026 02:15:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790932528; cv=none;
        d=google.com; s=arc-20260327;
        b=CjtKvCC1vFVeFe4vpz5oDBqZgjAU8/gnO4psbpOlY5dXEruobYk5KJqKoL12ITlLRI
         EC31ihfC+VaphFgqL1ptVhl5rqaxGPCP0jUZzRdXhi10t/VcuqartT+DxjLyFhCC8iNH
         Q2p/VAsC8S0jUpaIySxNNEaHz2OYFyf3PYGW0miD0tdmhSKIuHved1CPQ9HJT9kRHQ9A
         uYiRBJ58dwtQd4SCswKuu9cgEVpY3xynNl/Sk3+n3c9Uh7f0TCLhnI3kTCpoiW8dgG1/
         DB0onCIRgwZcUZCXGabXMzCiS+U540EPXBCqGw/f+vVwNWwv9cMNlLURmSAEMv1jTGTZ
         gulw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hWB1QcQGFZjdtaZ+WkrO/eQNuOSYDk3BPt9FwXfnsYM=;
        fh=l5DiAEA5lw3d9ezBdIZKXKg3nRRDWghwieV5IWu4Tn8=;
        b=mi7E3eLZf3XEPNIUiuDjlUnD6U5LAHO5R5q8TcZUZSX6HArteb6YncXDj+iFasPVZ1
         IZYyjqIzPm8oNWVO6PySDAdDWVnW7B9lblgZ+B8ptu6b5CwHdo2Xxl8eS4cVMqbaVv8n
         viCMA4Bb1+T1rfhNJejWSCcx1xLnWIUEUCVxnfsjkY7USkVG5TB2KTkvglL4Jh3ujWan
         DCX0ZES2Y7oNcPxHAXN19w3PB2hOENWTjBZQVdlhtYBwPjsaeIYqGwAsvyTLiT/fz7Af
         ixXUTCnOn0hjvQjy6XRwF8wTE6oagC1uBk4PyMj52GnP7m8p0iJpdXDajwTKSKNiXiRC
         feWw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790932528; x=1791537328; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hWB1QcQGFZjdtaZ+WkrO/eQNuOSYDk3BPt9FwXfnsYM=;
        b=mHYz+cGJCEsk8U/bfQOkjXwj5FIUKHvxnI5DJgfOvQbsY4G7X+T92ZoqLNWTLPiDjg
         +r1LLbRDwXMYFBR2JxOi/WIiot7+YryZnoFjZLWhK9i280bbf0sr13F7dhmvrG+B0shO
         Ddn6f9nczkgrLdqjVB3lGfizWMT0tGLbH3wSNDaYtEi3XyoiRcAw4FXuL1XRHeiXk5xR
         s2bIB3xiUVz7nf+ZWtActD7O9d6GSg4lSAvw9GacQldHIEOU1GQvtQ5n8nOgMJN+RSE3
         w9FkfT3LAVOHl2vYg6LqaXw5CYiluI4MAPbk0FujntvmhAUR43lvGKno1Oo7kG5hYRNi
         bRDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932528; x=1791537328;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hWB1QcQGFZjdtaZ+WkrO/eQNuOSYDk3BPt9FwXfnsYM=;
        b=BmgdBYEGyb4o/qa7vvH/53EU2qcMMB2P7VfT2gmWIog3hAR0OwCXlh5UlHHVs58HGu
         qzb7DIfHbClVpElTwvSVek0p4dzkVetNTF9ucmDkVDKc0ycx5r5EBQidN+MFl0ZVYpEv
         6qe7MKLx6hYTEkZeyQonz49siLAY53Z6zQweUhDjDv9naZWJ4IAgxCTQofvdhUyC996k
         iiUhP953N7uLFgjds1QpXFyaeC7o7xd12+oLNH3IbldIG+CNTkPxw3jFPFC2Q2dwLsKI
         YI4GmV0X6yeIs49LC7hDyv7x8ph9/6s48jYGfsW+DFUAQDQcwIZBGIBecG3J/JDFYd8Q
         nMZw==
X-Forwarded-Encrypted: i=1; AKwUvBzwKZgrt7YNM5UBuAVFeimls1QIikDepTG6EV5/hGqS2eOJiCyC/XMvyJrAvgjGSkiYRVBfshhozPvw@lists.linux.dev
X-Gm-Message-State: AFq9FYLzRymH3nDityKygVtAS3JXtmk/02wlkIHrSg7XzSQyl4UV3MPO
	goXAx25LIGx1fFnxg2e+ks8gdoXBHiVG9A7RHMu9eFvwffCgBVFacAkslq4QQ4Kqd7/aM0wcNtK
	nYlhba3xM0Lp825t+Ci+fqfygt/+3RwxX+xe9iOUW
X-Gm-Gg: AYBFou3mfG3odST2SXqeg4ErWHAxOH+4NjZOT4vmFR4S50ZigqZ9qfeXMFB2PtkNBgq
	Uh0euUxkmQghYjE9j8kysCrg8akdSp7hzxuX946fuNLnI9utqp0kZxNCCXv0We11qNRPrSQxxYE
	j08c37b7qMioClwKEpT5WpVDn/YIQ5VEa1qe1QmWY0ExnhDi+9n9Q/ruaVRS52Y8HvyZdsvHvbq
	dM11YmTJcSAjNWCUZ4+fNEl+roz0ueSrRbgBDh+2V9hZyaO23lsNYgRgR3klniggjEycooFXhxa
	DdT/iAILj+ZJ+KnjWIDVqUH0IwvlVSd/uRTGRUPGtvywKboTH+KYx3SCVkJWrnjto9a5SWgFUkI
	L9LBPaVXRDygosA==
X-Received: by 2002:a05:6512:1153:b0:5ba:3797:2359 with SMTP id
 2adb3069b0e04-5bb7c8d2f8cmr108813e87.2.1790932527310; Fri, 02 Oct 2026
 02:15:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261001210703.1597150-1-suzuki.poulose@arm.com> <20261001210703.1597150-12-suzuki.poulose@arm.com>
In-Reply-To: <20261001210703.1597150-12-suzuki.poulose@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 2 Oct 2026 10:14:51 +0100
X-Gm-Features: AclHuK81_w9T9KTmUVQvA6ovuNEn5Udf2ErB6CaTomYP4-WPob3E-hZqL0sp0qw
Message-ID: <CA+EHjTwM=5PXPVByVV75AuNVw5TJRiUqu5TNOcFNPOBmTiL-eg@mail.gmail.com>
Subject: Re: [PATCH v21 11/23] KVM: arm64: Use a local kvm pointer in kvm_handle_guest_abort()
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org, 
	will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com, 
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com, 
	joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev, 
	gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com, 
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org, enju.kohei@fujitsu.com, sudeep.holla@arm.com, 
	jonathan.cameron@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 Oct 2026 at 22:08, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>
> kvm_handle_guest_abort() repeatedly obtains the VM from vcpu->kvm.
>
> Introduce a local kvm pointer and use it throughout the function. While
> touching the code, fix the missing whitespace in the
> kvm_is_nested_s2_mmu() call.
>
> Suggested-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad
