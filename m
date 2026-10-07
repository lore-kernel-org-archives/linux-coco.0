Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFC0472095
	for <linux-coco@lists.linux.dev>; Wed,  7 Oct 2026 11:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791371287; cv=pass; b=rgD8R/RmTgW+wVrhMUrGvyVaSd7x/rYjmKHB/82hIJbmmSMMJghF0aW0WdqXaQUSWm/IU3ie/BhX+Dup5qMpRcfHGBsJiCwHEw0M4WEQRSxqu7L42N1ntCOxdtQPGTcP+6y95twim0xKqJ9aFxevb/nXzcLfJEA4uUlHcGEItyY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791371287; c=relaxed/simple;
	bh=n6pA0UCaHovGcyxtuarmqmXJupW57jUc87NPA1SduJA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pDFLG+IKG1+0LoWqYgg83wY6BiEMtFJyIkUZVmLHzmrg4wNwGNRRvi/QvE8/u+G+sVLYlHvlwZJW1AVq+g7dWDXdLJpRrK9E858BNtZ4K9yancl1mPVcdr71VpjPrkljijkcSh+pF3AonV8pRa1pGpyNFTU7koo81IlPlRFMTso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NWh7pia6; arc=pass smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NWh7pia6"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5ba40832934so5766e87.1
        for <linux-coco@lists.linux.dev>; Wed, 07 Oct 2026 04:07:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791371259; cv=none;
        d=google.com; s=arc-20260327;
        b=E2J1HoRrrxiOuK7fWM6nGELn6UateZAnt1dQShTj/32pC9DL6YNqnByFSWtyTGSrpj
         IZKdCjuIUGcHxMv1nEAS/JJ7t26fZaHUHZzvtXhjACfmXwGfos47pzkedR1V2Ii86PUJ
         ta77BguCWPq7Sc/8nOCjLeuv3MfJTdYxSzABs1TvKmsxjQACOKW780DGfUTxyN4ffQY3
         EqPLE3Ie/MqnhNIbyjiIc8oDePsKxkq3qKDf4We8ZfAOjixvgHDAKjB5UIueuSRJ1/eR
         p8kSeEgMXE+zQqVMXd5xlC7LgrYZNJ+60T9l4983ATeRjDXoyAfoQlOCdPTrIckVWFPo
         n9Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=n6pA0UCaHovGcyxtuarmqmXJupW57jUc87NPA1SduJA=;
        fh=bTaw4+xX6eMqDaCcx9BtHdrE2R6rQsakgnl58qMVIJc=;
        b=cvds9ecpXiJ4/1X9q6hs21p7d8rJ2HAwo5I1gmN0fmZDIbnoo4CvQCeugA4ivBhCS9
         6V5FWgwGgJzupXrmcwOCGebqwOSciCola1JQWv7NRK4d8cYWO8VQl9SLUmenUhFAdU73
         1At3/0Cv/IAANZ4OfX0q/ffiZIb4R7ZwEIpxCPzaIyPd0nuoFpzyAQzGFLPuM7w7uuN2
         Q5TPKS0btnuHCUowiHnPXvteDmkCB6mb/oGagm3h/GLukltF8ygfb18yQDhYKz7ukg1E
         hPYNBMpiGwkLYgNnHCBx3GGu8lhxYV26aScUYGwdiXIFxGZxCkgMu6Hw5lqpWnnp4kJz
         YMuA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791371259; x=1791976059; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n6pA0UCaHovGcyxtuarmqmXJupW57jUc87NPA1SduJA=;
        b=NWh7pia6v7nzNbWS2VW1qeMH8+xKwDt6aNt2mFk2sH6dy9vZQCIwMOx5++lAjz/Kqg
         E4+1Uo+V7qrdt1R7CSp8aRHlNAgY1UCLPojjT327TKhIQwLgPoOM0aW4mwJ2c9+G2Bw9
         5FCwDHygxWNdWapaCF+1LkyUx0JR1Oy4Blzj4p+EgHJbwdWhqyr/rHTpdvcFzF0GLrAR
         85np19eDSl/t7i0zCsJAbizVJh9Gp29du3zdBMcceiz3kKKILEInVr5LoCep9Qhh3/kg
         64bhNok3EaAWBHwxuIWKfzqAWMwQ/anoK25tUvfupAs2zD46DrWaIgrlGAdg1KrdjcTh
         /beA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791371259; x=1791976059;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n6pA0UCaHovGcyxtuarmqmXJupW57jUc87NPA1SduJA=;
        b=MApEZBENNqrMxYzStj3idptD9gAi5zkZDcq+TFgh7MJDaiiP85qkIJFDvexaQpc4DD
         2TcjEnxaiAekOE5cjUWD+1OrCsHQu7Z5jcCjX5uATLZwDyNJUw58ZiheRofiyxyNvjI5
         X4DWrn7mJzcuLWX3bUvaWRSjHML+zKUvuebMX/ne7r70PL+UDjDtgmym05GsQ8PfX8bC
         CuB/f2xRoHZeId8CXRSgJMkjLR6KEOhg401xSSFQi64TJuc6cgOcLrOl0SbRZc1rjuFt
         2StbI/dr/Janqr6pbjzaa2DSO0yMwvve04UsRp+KXCbQsQWZmNEHwc40UxEQqXUWA6ah
         lrOQ==
X-Forwarded-Encrypted: i=1; AKwUvBzCQfnfc2/1c3jYuBPoJgDuIMxsJGAUpIQXVJ7elOBIOakzYV3nE5Z02pqIPcK9b4h01zC5nQrkKsFC@lists.linux.dev
X-Gm-Message-State: AFq9FYJFMv8bG/sqtuXJvCF5oICbuxW5zSlAFRUgnNC4NK7yr6wHeaSN
	yHpPcAmgvkRhN/54vUTWdJn9zxrM+SoQhiw+1y72g9C0U46oBqv3JBtsZTN2fP/yoiU2iiJgppm
	diIWMmX28+olJIkCg+NzXlpDDph5yD5yOX2q8jBQD
X-Gm-Gg: AYBFou16oikbYZW5MRhAKFA4uZ6LhSUHmIgxrhNnKQQWa4ShwIJivrD79IUsOJty+1p
	njnIBXadmapy/L8YG66MBbobddIIuGUkSZq2Cb8tqSefWRQ2qnHqyg0R33G7A2RqBXBhnA/K9Cq
	3+ddh4jR5mfzozB2Ov7C0fd3cHAtnWwtUwVniprrr/bY6NZfMFRc6RCpOCR2nmBBo6CBn0P+TEO
	G38fCSNpV3ilY516tt4j37h96ua/oy68zJwsGYtqjJleGIkfqhvnQoOSRe2P67Ov7OYFIQkqXQF
	XE1Q/Yrifso7t9Mo7Tf2XiDg+2daPA2iJHcYxjMMVuuyetoJhH053PM=
X-Received: by 2002:a05:6512:1189:b0:5ba:3534:fb8f with SMTP id
 2adb3069b0e04-5bcca674bb8mr331538e87.15.1791371258668; Wed, 07 Oct 2026
 04:07:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261007073537.2454351-1-suzuki.poulose@arm.com> <20261007073537.2454351-7-suzuki.poulose@arm.com>
In-Reply-To: <20261007073537.2454351-7-suzuki.poulose@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 7 Oct 2026 13:07:01 +0200
X-Gm-Features: AclHuK_51tZ4nsMn3i-NEL4Otzbz7dcWMCHjhG-tWBC19X6nKIZVcoWjuDrLVic
Message-ID: <CA+EHjTw=9e4xv8SmUggCgHBM+uQ2v7dWSOf9PeBufMUofYPMwQ@mail.gmail.com>
Subject: Re: [PATCH v23 06/14] KVM: arm64: Don't call vcpu_set_pauth_traps for
 pKVM host
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
> vcpu_set_pauth_traps() bails out and does nothing for pKVM hosts.
> Clean this up by moving the is_protected_kvm_enabled() check to the
> caller, in preparation for adding VM specific vcpu load/put callbacks.
>
> While at it, do an early return if the vcpu doesn't have ptrauth.
>
> No functional changes
>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad
