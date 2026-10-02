Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C67645D925
	for <linux-coco@lists.linux.dev>; Fri,  2 Oct 2026 09:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790933069; cv=pass; b=dxV05Gl5K52HPkPE1Q58AMsaol9+X48xfJO4wGiZUo2P66EneLT72nzdG5zKXJlcQYHZBwwl2NLP6n+2LdxdZ92Bsp4G+HRhyU/ESCAwDoPvqfK+MH3JG51nXhdXjOlEEe253ClwY4j92dkJfbuJ0OtMMX+DNP4d/qNORR9Ui8k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790933069; c=relaxed/simple;
	bh=7PmFoTV1MhIrlyB9q/nIr5bTRr/fQsMqTgmO60KsB8I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lzmqGDH2fBOfZWnrmNlyT0h7f0Kd92e1NG4aIxTHOY1vbRpjTcdqqFRGj0clM1a8gD3Sk2/qE/N1/k1KtDy5QiTF4LU1JM9mEV7/U2YHBMpGXvZ2FB9zBbjGO70eSxyiuY1uZ93XNeZkpddeviGLOaqK0Bappt69i+aWSwWOdoM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=K0Ws9AGU; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K0Ws9AGU"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5ba40832934so4282e87.1
        for <linux-coco@lists.linux.dev>; Fri, 02 Oct 2026 02:24:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790933066; cv=none;
        d=google.com; s=arc-20260327;
        b=bcBZcFc/SI9YSUYWGEvBqjcAQECD5DcQmIit9uMu9+WgPMFieG3pNeZkWgbQa4A7d/
         WsmP9hr8J8AGal10VDTMOn0iRKH0QZsLA4CqY4J4igb8Sc+chdEiyT+mQRFUejMbnMRP
         4/Om09AklkJQ1P4CcOCGOIBlhiiFDiRV2X50vELzaJd4+pKeab1+0q0h2htoihd49uDl
         ex5SP8SfrrnqHsd+AocT7cdpgHQ4/iTVAh6MjPVGMdrcIrztTa2AOd92UZUcfPzzepDd
         8X6t5XPAKzjAeE3qmWt89ug9JXCXH9w8ULvkEBA0WAE5UCQHp1/SqrYCSiJJk209jhBW
         kb9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7PmFoTV1MhIrlyB9q/nIr5bTRr/fQsMqTgmO60KsB8I=;
        fh=eIg0TxXR0LPDf7JUb6fu//fLqKYWHy+gisJ6p2yCqeE=;
        b=RZ48olLIhUDMBOAGhcAbWPN3yWr9n1/6lAPOCgMDbk+BMX84CLt3/zu8gBdFFy8Fca
         jrV4coUKs9zfqt7KqD2nbEnA7SNNOFxOhQ9anwjSTyKOOx3iYg6PzpIUMDJrp4t9lvPY
         UqGjdzq5juoig/lvqCwshuGaeX+swEYd5ZWH7Poan9ugQUwLGgkMUh3ydrmlfzKvumfb
         1HOIEBLtsahGpIM77R4nkXM+R9ApBOg74YX6+qrzvBfHO71rKRVXgZ1Gm3rKv2BbyczK
         YPHf+BotYG5YbTC1AYGo2VnRFZZ5PQBzhs42tSocarTGhbblIcEWg49kKaEGqlRweoSL
         hhWA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790933066; x=1791537866; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7PmFoTV1MhIrlyB9q/nIr5bTRr/fQsMqTgmO60KsB8I=;
        b=K0Ws9AGULov6hiGdbrgtjnFOpj9fPErA9RjjKYMx7rq0vK2diRIxClAuQOvlyuDnw0
         EMEZpBQ16U3K+1Oaka9B2VAwLV+AME1NX1CCbbrfbTmmEl6m/iZQeisvqwLg9hDkF8da
         6nYzNicNgoluZwc9BeN/mVnv2DCaIpMmRl55Xht9fGQ5bH1C6ct1aIXcnN0VVUFzfkTa
         PXqgTmlkI/kmLmzOzvv0D5sUOfpBxgIbpjqTzmlMfUc7RyZhtUYuTnDeSAlvlwPms54m
         yYuJXxtm91tuLjBKoXMzsrJtWKdfidwgTLc8KrZvMm0l9qFHFOYLYQ+arNgbsbfuYP2A
         pc0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790933066; x=1791537866;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7PmFoTV1MhIrlyB9q/nIr5bTRr/fQsMqTgmO60KsB8I=;
        b=zosG2VTGXKPPVL+0E2g6t34U10oZFQAZOQmr7E82S2SxNOwfkRhD3A1Bi4JM/lmNP/
         nI3yaNRYllibgMr2CXorHNTBv8EIlGuIiGsqpfe/x0/0P4A20CiKXYvXj60hrXcZOf/D
         90E4bNIjHaFoLo4jyrmEd9G+UXccHc+6avAOlQndBsaCwpcBSHQ8VVJy+YWS86/2jCxp
         jSVrsVpvNP1K1Ov5U4DLef8CBKaxk/tRGiG5Z1E4/zJqWSYS+g9lrlZMOJQvdd3NtJxg
         16n5XbRXg6FY+GpvvJencGQ8g8+y8nNfsCb3/K+QZBsOiPWknFTe2E10NJcMXiLnMra5
         9dWA==
X-Forwarded-Encrypted: i=1; AKwUvBytK9rLhyRlAIWXO3BznYc327HW4JipCInJ9UOVjZTMYuLhtvtP9aIUWJd9vjYLXRpw2OJMtmLJOiQp@lists.linux.dev
X-Gm-Message-State: AFq9FYI1F9V0lYtu4XRoMhKpM+VVat9C0IvCYwkpoC4ZYnBWblk5JHxd
	j1ASIpBtwAAmlJBbACXMS1tRLzZ/XapWY1ahsLsmcLJXv6SL4LqnGqoc3jUw7coIbDuC31QVgsm
	AsHvDKfha/ulFr39HmTxcPf4mu1E2glUjh9GwtOSA
X-Gm-Gg: AYBFou2UslGNScTPyRBA/Sm7V7JuakMrMO2uGX6FNSf/9TL4N1bU+dF67mlYJP0EN65
	oWZ8GAzpIRbd8lLuKVzJNAlQmOFeKIS1gCgqhqc4CztLpnfai3l7DSdX5jNGDQ7KxYdT4lx2FPX
	/bu3d7EzlzVEYEvFPVBVsVjr18xmVJRGOzr4rLCT7dU6s5GhzzRz3kt0ENMSwn/gMs4Pp5DUlCi
	aFAihFBCNAViHaDmoZpNESDhDzSirzzIdiYjvKAYRKZ1lKwHajPwO3oH4ES//2dYdOp+Yd+Df0n
	QtKGFFZyv6Gc4LFJRamllYFd+dCmuS2LSLS5ldn+FheEgs963bG+zUR0w2+gZ00K6dfgGkGEYTB
	hkso6TPmQDizx+Q==
X-Received: by 2002:a05:6512:b8e:b0:5bb:ff6f:b4bd with SMTP id
 2adb3069b0e04-5bbff6fb595mr82503e87.14.1790933065552; Fri, 02 Oct 2026
 02:24:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261001210703.1597150-1-suzuki.poulose@arm.com> <20261001210703.1597150-14-suzuki.poulose@arm.com>
In-Reply-To: <20261001210703.1597150-14-suzuki.poulose@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 2 Oct 2026 10:23:49 +0100
X-Gm-Features: AclHuK_iAoRmEqRhd3Pqw1bLNIyTQ_Nu4t-bE7ReQMk3jjFJ4DGtZ7fagNuCSDg
Message-ID: <CA+EHjTzz+nmaMDQBXt2e4RU8YcsJOJkVevygJHsq_jbon8PsXg@mail.gmail.com>
Subject: Re: [PATCH v21 13/23] KVM: arm64: Mandate VGIC v3 for pKVM VMs and Realms
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
> pKVM does not trust the host. Realm VMs follow a similar trust model, with
> the Realm Management Monitor owning the protected state instead of the host.
> Add a helper to identify VMs that run under a host-distrusting hypervisor.
>
> Use this for blocking ioremap of vgic-v2 into stage2 and prevent creation of
> VGIC other than v3.
>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> Tested-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad
