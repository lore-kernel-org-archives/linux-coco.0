Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FD0495021
	for <linux-coco@lists.linux.dev>; Wed,  7 Oct 2026 11:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791371623; cv=pass; b=DQr0ZW1z5HQdoHBClA4pI5GOhUT9cCFemtdN9cMmsp3EQqUCXF8HBmLY1Fes3WyNc85VjOakC+BrdF8d0scTDUdtzxEi0NH3UjtPXJ9+Emxw6XSm3A+jJtGfbYUKoeGNVSy/ITQBNFD53grq1hjpkEW8awV/tAjuAr64EK3iUYo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791371623; c=relaxed/simple;
	bh=f+RisWKCQLZOEfrvNgEfr/uIKD0wCzcM3ghzQdvYe+U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ldgpD/OfU2gJ+d/XlQUhQ2+2rDWpX2OmnkA1R1Cm0rw4DD7OFZLYOQl+JgwD3MJhzjcnYFwqupcys7iUJSXyp1nXfz+pYEd+1d+c68bZhfFfWKvTPtCgBYG/+08Sdklw8jR2OxjWKcG+Lc8U1vyZWJakaaqgMuLPUpBiXAU8f+E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=q2TPnXkJ; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="q2TPnXkJ"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5bcc04c71f5so7595e87.0
        for <linux-coco@lists.linux.dev>; Wed, 07 Oct 2026 04:13:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791371607; cv=none;
        d=google.com; s=arc-20260327;
        b=bu+swfazjrjGAEvMr5rrSosQG5RXTzHm11Q3giu3w6tYHKd4LC64cFEocouhJAUoKK
         haljUljOMupzUHcvZrz1DNou5i0nExTgUpCdgXmcGzEKHO55Tle/jF6Kgu1wU/TZKMY/
         6luqMcRHpTqx1Qi2smjiqj4byecEYxRh13TsCQE9P8bE+Pj8wvpjyqZVqoCMXFX3n+9i
         vxT2TbjmCOJrCgsSmG5GAJalyAlb1CLqzkjaahXgkhBvvOCF4ptQdcm2Gtc2/s7Kc9jJ
         Th+FYtDTNZbU58oi7K2qedY2Fv+dn1InNdsaYYxLNlxsEpZCjnG2Mzl6BO/S5f/m4H3f
         KxZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=f+RisWKCQLZOEfrvNgEfr/uIKD0wCzcM3ghzQdvYe+U=;
        fh=h0Q7R2cGL+jcaSvpVuEPeFrcAKzza0TFi/zUWh5tcA0=;
        b=PpQ5xu4XziGI/ghqnH4zvCxglZNvLwUkifzlo2po2eBHSlhLZJr8hB2Z/Y3rpq7WVH
         mIdMX7TCSs5Sin+ZWJzPXm7oJRmbQLHDp4+hm0ZnRp7eCPmBV7+cg+MKhHLsVuqg7R8P
         IWGAkvpHedvQ3fD6zwJPeN9UfrOfaX/jpx67E7xPlxgNBH5PF0MjyXWUodt16Ath/USH
         ke4arQ7TWd70hrcI+UA4Rh1bBNrY6mxjm544qWcX4MXCBHHCWTAbcXF+xRloof7C5V2I
         g1a+xIXbiQxcuZJX0xMjDCANiA0FG/Om5xIXIJFrvPmvBDovYhfSUPXcp4rcis8ASD97
         8sXg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791371607; x=1791976407; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f+RisWKCQLZOEfrvNgEfr/uIKD0wCzcM3ghzQdvYe+U=;
        b=q2TPnXkJ7KvltQQqtUrFoyPDFMeqYHyEoCube1MRGpFNMbrs/juEJDr64DMHO/y1DD
         AiNxXUniDKyngxy6xtrx0AlnLxNk2R/7wvscmDGTaxnwtyUQUd8lc4F8T1fh4CgeaT2w
         XySYHkyixjfqIL9JcXbXyJV9yqGLvB7Ob8oKkfko88MaxExxx4v38TNv5RKb2DpMOP/y
         xBc2zFDOBGpwS3Hd5NcGxedJFoslidX2TR77yWX5V6skDansBm51dDbch0cg4PiIW9Mk
         EXNtu+H/J2gZx371VirkOt7dG+7Hod8Hq4DMFzJBdyaHqryVQ6PCyMJAJuinqjr6Y9y1
         GGAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791371607; x=1791976407;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=f+RisWKCQLZOEfrvNgEfr/uIKD0wCzcM3ghzQdvYe+U=;
        b=14APXSmU5FQ1qBSzoc+hOjTuI5P+Z+/wBdQF/5o9+Mu+6nRN10FSlL3IK62Mvkdhfl
         yDr6ocNuOwoeXK8VSrNEmNtsKDHu+3G04zvI4dOkNJFuumVE3ml1C5ju3pNaky9PivWV
         5egtiG8IJctqjZFgDRl0l2N+JwRZs50P7+0KuI4kHgl1KIbr9AmhkAaLKvzUnKBiWTE2
         Yj5YKWI0E4q8J3waY80/qnTIAOzSwRzvcJQ2qJ2neRPySGfb/rXZ2eRYXdttA0H1mIyU
         wDWclnoaou7Z3/LJry+yGAB3rWO0XdJV6agK4ckG9Kw4GbRSgFVjnuNZ8JLKAvUWz4Bb
         ePtg==
X-Forwarded-Encrypted: i=1; AKwUvBzopqmEXpaP+YocWXAz6dXAlsWRYghZ1nzs/jVtGyOXJ6gRT0NsZHiKEEbk+xRYbtF3QUlMOPUamqpz@lists.linux.dev
X-Gm-Message-State: AFq9FYI61sDGe46jsSavOMiQnc3qH5WLEI3ryT1WZkrQu2weX2cUkfWL
	nOd2V4U4Bxkp7EqY1dpOPwX8IRJQFPFmKuvYdp0q63bs1DyRiWd1LsE5aephV09ZFCD+XS+UbKR
	cW9wPPxK0RyDHcVZdzzgsKu/ZrXTmW2xSncaZ/Irt
X-Gm-Gg: AYBFou2pfqd/C+pwT/MbimTJXSnXKKmfZJQ/baBJcXwoXeJuZ7yvsB4hVqa+xpq+UKv
	HIXopsR79aFaSzOkRvzKo9qvnEQdcX2IYtn0QSwF0p9xZwXDhkvBoe0BmguTAS0Kapw2mGfow5G
	a/ebweWA1QUB6tOfnnA2BU8yrDKiJHY6XCvE20JDNym+4orU4G06AeSKEKIWCIcYRDUGJvsvbEV
	obwiJbcem8jNBc8NeiIQr3rEEXP8Sz4SNKKX9gGqUNohSu1QweNGPBXoAasroRa6WgbhuJEeIia
	kWuzsv4uE+zR/sAeArZhjQTuGeIVco2Gx+n0wWnqkjQ8loHVAHJDdRL/WiqcHrtFhA==
X-Received: by 2002:a05:6512:135b:b0:5b8:f142:cf3 with SMTP id
 2adb3069b0e04-5bcca65b3acmr273089e87.11.1791371606791; Wed, 07 Oct 2026
 04:13:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261007073537.2454351-1-suzuki.poulose@arm.com> <20261007073537.2454351-8-suzuki.poulose@arm.com>
In-Reply-To: <20261007073537.2454351-8-suzuki.poulose@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 7 Oct 2026 13:12:50 +0200
X-Gm-Features: AclHuK8WLpu77qQsvdg4MDduFoR68Hrl6zUyd6Su64I0GC1JFRH6-dZAB7pnQNs
Message-ID: <CA+EHjTy2WuCui_O8sYXviCmgLQfZ-j-jOBQqRY9NOXzMGQ5k+Q@mail.gmail.com>
Subject: Re: [PATCH v23 07/14] KVM: arm64: Refactor the vcpu_load to allow for
 VM specific callbacks
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

On Wed, 7 Oct 2026 at 09:36, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>
> To keep the VCPU load/put handling cleaner with the different kinds of VM
> types, we are about to introduce VM specific callbacks to do just the right
> thing. In preparation for that, make some refactoring to add the change
> easier by mainly feature specific configurations to individual wrappers,
> so that different callbacks could reuse the helpers.
>
> Adds vcpu_prepare_mmu()/vcpu_put_mmu() wrappers to load/put MMU related
> configurations for !pKVM guests. Additionally makes it explicit that
> kvm_arm_vmid_clear_active() is not required for pKVM host.
>
> Add vcpu_load_pvtime(), vcpu_set_wfx_traps() wrappers for handling the
> corresponding configurations.
>
> While at it, also make it clear that the timer loading constraints only
> apply for the VHE.
>
> No functional changes intended. Based on a work by Marc Zyngier.
>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad
