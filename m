Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643CC319617
	for <linux-coco@lists.linux.dev>; Mon, 28 Sep 2026 01:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790558888; cv=none; b=DJTdq9eHTeC0Poc8XaYeQqyYjXrBtALMUD13wqnYWFbA4vCYkcs7SLHcnFa+PAk7vQblG0O3w6uIvrbWGf1nG6A8Ej1k4FAgZnYf4lig7JiP/iJR6HKG1GASBjUFMeUu0kPv1+C/gNrZazqa6ppm3SchEP3/9zgzPl27krFhxrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790558888; c=relaxed/simple;
	bh=E7cY/7poBmsn/1R0JExGYYnhLt2AAvvBzlqZZtWGrFM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FS9c1PKEKHClt3+fQKMiT6w1/uaBI4PI7o/axqRJA0GqfdDUjqC2kqyV6pe/3oN5k6NeMhTE1VdZ/rSanO/355rcc9CougUVVj0acXmySnP1DllMNPrfTy7cVnpjVjfdHFQchSJl/JSJFmyDmb66IKaCdnqbMrL1n5AUz31rT3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hUq2C6tW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hUq2C6tW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790558886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7Pz+VkJaf3rDADUJdpqmWyIZGulrG9C1hI5BJar5zt4=;
	b=hUq2C6tW8q4yQfXyAC+XF5jp+UpbCjigBPScNRokO+V9axxeIeJdNPLo2Q8o/zFUgB+ccu
	qOSZypOROCx9ulzKgDq5jxY977VzelkI/9ejD7UJ2qaXN/N4uYfU9Qg9G+VoRbVvyAvOfP
	frECmDvgMUzxCvL0ko0tBTXLjnf1B9w=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-f26R3F_DMHqson9FmWoRJw-1; Sun, 27 Sep 2026 21:28:05 -0400
X-MC-Unique: f26R3F_DMHqson9FmWoRJw-1
X-Mimecast-MFC-AGG-ID: f26R3F_DMHqson9FmWoRJw_1790558884
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d001671a54so25303515ad.2
        for <linux-coco@lists.linux.dev>; Sun, 27 Sep 2026 18:28:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790558884; x=1791163684;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Pz+VkJaf3rDADUJdpqmWyIZGulrG9C1hI5BJar5zt4=;
        b=x0cQ9JKS5ASh309D8/jC0wmWmPO2nFCX9MMcrlXF/vuFqNucCdjufaXKpooFv6z6mr
         84ovqD8n9ZM05CnObc8wOyxuIaRUo6FaVG3DY+G8CrJPGVBicUKvE2lIz3ij4ecHkrNJ
         xot444XDz+vGt+Ein9ngC/YIj6gpUjAweSaMVNeNAm9/uBTFxWWJIBa+rVWHZMWIfaNL
         fVo9bcgMn9lOG3yVtb6/HlvKWAuQI/d5cEDuS1vN/M/hAGgu5XZAXXewIxTnBvj0OoJz
         t++JMuTF+eL65UJ90bM3DU+iW2hJTG+bZmCq5aMypdYiktiZz+cOK5kB73bmJPUliFSF
         kaRw==
X-Forwarded-Encrypted: i=1; AKwUvBw6c8vAD6I9XBEkPYW1lv3IM0sQbMTXPULxVTwwxzq+i1oHwlETgQ4tWkfIEhfd49Hsidr+UVVoQ+3x@lists.linux.dev
X-Gm-Message-State: AFuF++kbHaZtfqrNb5l0tfMaXbMDy8iV3KmZT1QHVfL5L7D99yzN7AQS
	JPE/CyzrljzSBGchnl6mhMK5pfMpUNjkMWRssrg5Nl+3tOg2HXS5qrbCl591CYLniHqqA1kSOOA
	YTpHIEXOCAF6/8zQ5XsT6WTKAyWPnHl6ycj72vfxDiLAL3JnoLTEO0PuymZsnLJs=
X-Gm-Gg: AYBFou2bA3ojxNxesMb7bkCERFHgLmeqC5z7MiiCyQwXb3xlkthFLbbTD9jdCzJ5BFL
	DnXvs8jG2YGk4UIGVz9JcTFQPk9LQmI/nSoXdqHESNluciS5h/DqKLYTDTZalsglFWSkm4RrJSg
	r2uxI0Qb35FcydDbrVCvKGf91/bBnums/FweWD77QS4DGI2zqujLLuphPEH7AwI8aFMahLIZK8/
	6fhWHTj9M/DusBL2kfPjjWmUaQ8qO6feDQvuPYiMc6XNI1b0eOEcgE6M5Wo/Tbcd376JhASP8DO
	xwP1teEHB6xkpeiy3vNHw4oh7T5dt2WrzXJ24/sBf1qKjdqrLbZy+uZtNyWVjlJoBeZYbt0fdyu
	d8AoGVrgwYMvrrcRrGel1yU6l6B8Qw39a2pZUVd4Rrg==
X-Received: by 2002:a05:6a20:244f:b0:3de:6873:84d1 with SMTP id adf61e73a8af0-3de6873856fmr678771637.74.1790558883866;
        Sun, 27 Sep 2026 18:28:03 -0700 (PDT)
X-Received: by 2002:a05:6a20:244f:b0:3de:6873:84d1 with SMTP id adf61e73a8af0-3de6873856fmr678737637.74.1790558883223;
        Sun, 27 Sep 2026 18:28:03 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc794ef8befsm2931082a12.12.2026.09.27.18.27.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 18:28:02 -0700 (PDT)
Message-ID: <346eb257-23ce-4a43-a17a-f532d7448582@redhat.com>
Date: Mon, 28 Sep 2026 11:27:55 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 15/20] KVM: arm64: CCA: Introduce Realms
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260920212845.707-1-suzuki.poulose@arm.com>
 <20260920212845.707-16-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260920212845.707-16-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sK2T2DjM_WDFmEifNDanKwBL-JUBfQsTkVaBxYxfKgc_1790558884
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/21/26 7:28 AM, Suzuki K Poulose wrote:
> From: Steven Price <steven.price@arm.com>
> 
> Add foundational work for supporting Realms.
>   - Add a new VM flavor.
>   - At KVM init, check if the KVM can support Realms (though not functional yet)
>     and will be advertised by static key kvm_rmi_is_available. This will be
>     turned on in a later patches, once we have all the bits and pieces ready.
>     For now check if we are blessed with KVM_MODE_RMM.
>   - Add realm specific tracking in kvm_arch. Since Realm and protected pKVM
>     states are mutually exclusive, move them into a union.
> 
> Please note that we cannot create Realm VMs yet. This requires further changes
> to the UABI and core RMI driver support, which will come later.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> Co-developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> Changes since v16:
>   * Share mutually exclusive pKVM and Realm per-VM storage in a union.
>   * Move to the new VM flavor infrastructure, split bits out. Trimmed down
>   * Move in Realm state and basic boiler plates
> Changes since v13:
>   * Most of the init has been moved out of the 'kvm' directory so this is
>     much more basic now.
> Changes since v12:
>   * Drop check for 4k page size.
> Changes since v11:
>   * Reword slightly the comments on the realm states.
> Changes since v10:
>   * kvm_is_realm() no longer has a NULL check.
>   * Rename from "rme" to "rmi" when referring to the RMM interface.
>   * Check for RME (hardware) support before probing for RMI support.
> Changes since v8:
>   * No need to guard kvm_init_rme() behind 'in_hyp_mode'.
> Changes since v6:
>   * Improved message for an unsupported RMI ABI version.
> Changes since v5:
>   * Reword "unsupported" message from "host supports" to "we want" to
>     clarify that 'we' are the 'host'.
> Changes since v2:
>   * Drop return value from kvm_init_rme(), it was always 0.
>   * Rely on the RMM return value to identify whether the RSI ABI is
>     compatible.
> ---
>   arch/arm64/include/asm/kvm_emulate.h | 16 ++++++++
>   arch/arm64/include/asm/kvm_host.h    | 18 +++++---
>   arch/arm64/include/asm/kvm_rmi.h     | 61 ++++++++++++++++++++++++++++
>   arch/arm64/include/asm/virt.h        |  1 +
>   arch/arm64/kvm/Makefile              |  2 +-
>   arch/arm64/kvm/arm.c                 |  6 +++
>   arch/arm64/kvm/mmu.c                 |  1 +
>   arch/arm64/kvm/rmi.c                 | 18 ++++++++
>   8 files changed, 117 insertions(+), 6 deletions(-)
>   create mode 100644 arch/arm64/include/asm/kvm_rmi.h
>   create mode 100644 arch/arm64/kvm/rmi.c
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>

