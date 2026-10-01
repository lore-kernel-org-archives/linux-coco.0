Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C894C4A4830
	for <linux-coco@lists.linux.dev>; Thu,  1 Oct 2026 21:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790890913; cv=none; b=SfLlvmscyxSfmQ51a7qiWVNaFz8ACzoQgq89Q9MF776988Dc71DnN/BLVo9T8IHM/MHRakujozU35wCo2O0RobOF2Np0BT8Xq92rUbZM8Isuh1TwNm2t6KafxlFy/ZQDI/6Zo5XxQNZF1SlQz3Lg4IhElUfUPgH1s/6otVAxhqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790890913; c=relaxed/simple;
	bh=fPmxCx4qpK2t/MvuNp/xRsfzossr1PfbTfKiv5o2cf8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HxzqBchEpJDnU/iQaFgVuaO0bGWNBHnaFmTW51UpxSvA+RtrT57Jf4yMyoXViFOVn7aaL1NQ3IxTShzGiYK932jJuEjwmvEHIT73eDKt+xcfQTMj30CjXYRNgPnf5Bh2j2zgV7SVw9QDHcZO5uHtHRCIen8CG9qN0tdtDs7aBE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iBhZyWpw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iBhZyWpw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790890910;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oaFDnLPAu8Azz5pGOzAaVOnZU0E7BdpohXF2E62Q87s=;
	b=iBhZyWpwekUDL1AOmUn+zdXRsixheugG+A7N92Xng1GBJwLvSv3mj/fQk4codJ5upurnc9
	ka/9XK2c9ZqglAAR9cSO7R6C0xyI/p0ZTfYqhkbDsgm8FqT/y93EPaBi6FB8Yc8x4ZqONC
	XQqV8Ty97x+F/XgeGPNYa1Dw1sFAt6M=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-vP9EtVitPe28Mq27uNvNxw-1; Thu, 01 Oct 2026 17:41:47 -0400
X-MC-Unique: vP9EtVitPe28Mq27uNvNxw-1
X-Mimecast-MFC-AGG-ID: vP9EtVitPe28Mq27uNvNxw_1790890906
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8696b921ac0so5928732b3a.3
        for <linux-coco@lists.linux.dev>; Thu, 01 Oct 2026 14:41:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790890906; x=1791495706;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oaFDnLPAu8Azz5pGOzAaVOnZU0E7BdpohXF2E62Q87s=;
        b=kdzQqfdZsQ/0I2tL6+HbdCuRrMJn9RiJZhFoO+sSrJ9+ykpRrvLG1hDR2mwndTI0RB
         K8+AOB58T3rZKHz1QP7IGmwjs32geY6kNKgIBPTxkQ4XS+skiUI2aMp2QG2woWxOvhdS
         9a9NSFqBTFlB/bOr1ADTiBKgX3fCJ6ZtHlYJpNBiSEQiAs/21CIZChKtnXyPouONe3td
         vO7zAj3HY62nI4prTlSjg+or8BLXK4KhLiyKyJ1OLhBse7/hm6I43GBdIC62Tmt0/yKm
         ZvqcQaZ7TjxycgaF2Yfe33e6XvfvmAuhm/COzeNvWjFidYBxmpt4Lh+8s+hYg3jr0Ark
         gOwg==
X-Forwarded-Encrypted: i=1; AKwUvBywo+YbeOz4pf+rcrcqkyIZ5QkZ3ShSvKI4utJnhfHnHsv6CoQB/OPrqcDj3ArlnIM06dTogPgOo1UL@lists.linux.dev
X-Gm-Message-State: AFuF++kHtRDuaLy+4NRhvu635tArbL4xwTNL4J7hH+JInHitcni3aoPc
	xXkiasO1WA/R9U5gKqvgvGNcYnzMDgoVkJAZH8gtgQN1zeL7Y+8UHKjnJ0bGn3Z8FW+uMFLWZaJ
	wI2988fCNiVR4+ev4O0Rd4Xxrx8KKQEAqBNcoEoypIiQUHyz8IuGoDmQYHnKfF68=
X-Gm-Gg: AYBFou25zwz8t5UolIYK4aswuXj1cfKldE1znANOKrotUpVDt0ak63zbSLWksdauIgr
	tt+bDNFvzb/rUpxp4FAGws5LJ9+f7X0BndluErNIvalqYKqHLnjcMzlxwjG0iET+eF7RrFcnCgK
	2bHkwKNgireIxq7H3w6tnv/bbsvDN6E8ZCcqhf+RAuCwTg/wr8yYuvABFxUETWWyk4cgzdhv0Jj
	CmKH5tL0/9HpuoK3hzfYqbFqu/jbbfUN28aqk0zjLxBy20qJz7PaZdIRejTr2uuE4/fazrMe2Sd
	mPjGV/L5RD4o/ERkHdDDzOdL+zHAnhMZZsOL3K3MySXMN6BrXBEcCGgx8qqN0PBJcg1v+cH4Se9
	B56fBvsYZRPitRp/xJI6Yf4vbk2zjaR/TJCCqqTkrJQ==
X-Received: by 2002:a05:6a00:409a:b0:882:1b4d:1840 with SMTP id d2e1a72fcca58-88af58d4e46mr745864b3a.24.1790890906220;
        Thu, 01 Oct 2026 14:41:46 -0700 (PDT)
X-Received: by 2002:a05:6a00:409a:b0:882:1b4d:1840 with SMTP id d2e1a72fcca58-88af58d4e46mr745848b3a.24.1790890905746;
        Thu, 01 Oct 2026 14:41:45 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0cb72834sm165561b3a.45.2026.10.01.14.41.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 14:41:45 -0700 (PDT)
Message-ID: <1ed590aa-a4bf-4980-82e1-185aee205909@redhat.com>
Date: Fri, 2 Oct 2026 07:41:37 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 00/23] KVM: arm64: CCA: Add basic plumbing for Realms
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
References: <20261001210703.1597150-1-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20261001210703.1597150-1-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _mShYdCI9qj5sYMOn8XeHl_tr1ybPN-3T3j_k3DqMDU_1790890906
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Suzuki,

On 10/2/26 7:06 AM, Suzuki K Poulose wrote:

[...]

> 
> NOTE: There is a conflict with Fuad's patch to drop the WARN for unknown vm
> ioctls, that is queued in fixes.
> 
>    https://lore.kernel.org/all/20260914093838.1082637-1-fuad.tabba@linux.dev
> 
> This series is comprised of (3) and (4) above.
> 
> The integration branch has been tested with the following components:
> 
>    tf-RMM:   main branch (commit 5e6e2acd) compliant to RMM-v2.0-beta3 [4]
>    kvmtool: git@git.gitlab.arm.com:linux-arm/kvmtool-cca.git tag:cca-kvm-v20
> 
> [0] Arm CCA KVM Support v16 : https://lore.kernel.org/all/20260803134403.80630-1-steven.price@arm.com
> [1] Linux firmware RMI v22 https://git.gitlab.arm.com/linux-arm/linux-cca/ cca/cca-host/fw_rmm/v22
> [2] Linux GPF Host  https://git.gitlab.arm.com/linux-arm/linux-cca/ cca/cca-host/host-gpf/v19
> [3] https://git.gitlab.arm.com/linux-arm/linux-cca/ cca/cca-host/kvm-v21/integration-v3

This branch doesn't exist. I guess it's "cca/cca-host/kvm-v21/integration-v2" instead?

> [4] https://support.arm.com/documentation/den0137/2-0bet3/
> 

Thanks,
Gavin

