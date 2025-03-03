Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9351D516A
	for <linux-coco@lists.linux.dev>; Mon,  3 Mar 2025 03:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740973366; cv=none; b=llrW6QQqGxvKlGLevJYtBb7FwOfyPrcWeJx0Mk4tMLUqkfyHcjqhCqtxbpQc7qdODuzJdQlfXtFjBocPs3farwvtFpXYib+HK8PZlnsKlmwsNIHWY6hrB+cS9Wbj2bj4ECB+V8/DrIvp/2bgrYAjFC+lI137csgMwqP//1Vecd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740973366; c=relaxed/simple;
	bh=38g/wttyi0OVix58IXmMb9keoqRC6204XM1tdy05KJs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qjqe/4Stu+6ZJh2Ttnb4kujCuAmQpNC3PT+pLZjCRNwxBNONkbZJNm4wv+VRnj58zKcjYSYKk5O8OuKYy+2j8giEincZl1FSQpKv7/W94Gp15/YzAD7L3W068e83jkdPQz0ToDCB0vWYDNlEt0Cidg9BNoCxd3Wlc9l38TQRN0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XAOy0S1p; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XAOy0S1p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740973363;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IEDc5a+qaJ461fEOorI0aPSdSVAqOPF0WWp/svcyhEc=;
	b=XAOy0S1ptCfOW5O4GhMU1jGMIcSD5pzPGHxAoVL3EC1QXHGDS6naO1H09lFLTfc2Zjjc34
	90tgF1iw8KVuGZbIk/Z3vwf0rDieUWF/9s1QZczV0NJ3pVDPpb6OGoEuUu/w3qwUMzPwtn
	dv/AzvzkU4iGq5oi8wwqvu57TF9O5rg=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-484-FhoIpL8HObW65bn1zIenTQ-1; Sun, 02 Mar 2025 22:42:39 -0500
X-MC-Unique: FhoIpL8HObW65bn1zIenTQ-1
X-Mimecast-MFC-AGG-ID: FhoIpL8HObW65bn1zIenTQ_1740973358
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2fed5debb85so2818515a91.2
        for <linux-coco@lists.linux.dev>; Sun, 02 Mar 2025 19:42:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740973358; x=1741578158;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IEDc5a+qaJ461fEOorI0aPSdSVAqOPF0WWp/svcyhEc=;
        b=VcoA1JCWFNR+OzCFnwD8YaRya3pXqt1X96OfIAb107G2rnZLwkqWZXC4CeMEysb06R
         O+kAirv1z7G06wDKjLB02Xiegp6lTKXZVS/2rmkwkAimSfewqfzsk3QGpuIk50hE/VFN
         cl/b3IBqIfChDSR0/lO8TbdCmNjjTK0zE7mWpZ9HEwbd+t+PtKBexmtD/Sb/OZ1gNYFR
         AJBPOlqrgEBB8N9foWEF0fZnSo8mqdSF0Cn/XJzaH5YdQoSCVgRqrVYNUz4UDS4ingUY
         EepLseilNu9CE8ftJT2V2nnKy/aS4IGqZ2BMVKn9O6F4J6jJL0YRTHypTPofKAGrb6ga
         cawA==
X-Forwarded-Encrypted: i=1; AJvYcCV4NxdN9dJP4uGQ4l+MjUG4d1k5nb58TwsngAPiirmOiZg5HQGiMDfl1Amn4b739k2+OVxvzhtV0CHU@lists.linux.dev
X-Gm-Message-State: AOJu0YwK1JJMgL3h17MXQvHuk7pav6ud6dA1XUWhJWXq9wtCoqQGOUL/
	kO3kLkkEHybM8fyCPzDSsKZCoh3zCBMVjk+JBe6WI/H2HBAEfHXbAa6ZgxmBkFlASWsxTFvFPey
	a+JQGLTdzvcoMm6VzQp9QKesOego07gPTZ/UCKEVlKUPDSewqSYtFKPindqA=
X-Gm-Gg: ASbGncsmMhblsupRdo3atpVaSl0uMQT7xDwSnuElrSGovPQWab5fynBM8ZRXz88TD8+
	IBR/iC4CMPDk1majwLEGBqAPXmwJH6OLVnD06F33HwaKqswlKsrfLj3+8IkG2EX/SOgiL3qlwsQ
	AoUA8QRGX+11m68lTwAngudNM7FuiqFIhQyBDCvWFFF5QCHQrTreZNJeu1hZFMm2zXOXr5cngQw
	Df6A3DTDZGQ6MpcmCx9I7UAqejV5XTIWB3PC5qizs3D4+oWr7OP9V9iqRQcp9ojsOHmX10ZQZko
	cGXxV4t1IQce3IJLIw==
X-Received: by 2002:a05:6a20:1585:b0:1f0:e708:56e2 with SMTP id adf61e73a8af0-1f2f4cffa11mr18287104637.22.1740973358578;
        Sun, 02 Mar 2025 19:42:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF5c7Qc3VVFcg30Esq5DIzJh6RfeW5P5eI8KFXRrs6oJHF3s/m+eXSunL5iyzYk2nV2q0PqZA==
X-Received: by 2002:a05:6a20:1585:b0:1f0:e708:56e2 with SMTP id adf61e73a8af0-1f2f4cffa11mr18287060637.22.1740973358238;
        Sun, 02 Mar 2025 19:42:38 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.164])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7362e3b1c61sm4421335b3a.22.2025.03.02.19.42.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Mar 2025 19:42:37 -0800 (PST)
Message-ID: <8f08b96b-8219-4d51-8f46-bc367bbf2031@redhat.com>
Date: Mon, 3 Mar 2025 13:42:29 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/45] arm64: RME: Add wrappers for RMI calls
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <20250213161426.102987-1-steven.price@arm.com>
 <20250213161426.102987-6-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250213161426.102987-6-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0ByLLwAeglMUh3XDpxnaAo7dz-q3xJg6MZqPaNKKag0_1740973358
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/14/25 2:13 AM, Steven Price wrote:
> The wrappers make the call sites easier to read and deal with the
> boiler plate of handling the error codes from the RMM.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes from v5:
>   * Further improve comments
> Changes from v4:
>   * Improve comments
> Changes from v2:
>   * Make output arguments optional.
>   * Mask RIPAS value rmi_rtt_read_entry()
>   * Drop unused rmi_rtt_get_phys()
> ---
>   arch/arm64/include/asm/rmi_cmds.h | 508 ++++++++++++++++++++++++++++++
>   1 file changed, 508 insertions(+)
>   create mode 100644 arch/arm64/include/asm/rmi_cmds.h
> 

With the following nitpicks addressed:

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/arch/arm64/include/asm/rmi_cmds.h b/arch/arm64/include/asm/rmi_cmds.h
> new file mode 100644
> index 000000000000..043b7ff278ee
> --- /dev/null
> +++ b/arch/arm64/include/asm/rmi_cmds.h
> @@ -0,0 +1,508 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2023 ARM Ltd.
> + */
> +
> +#ifndef __ASM_RMI_CMDS_H
> +#define __ASM_RMI_CMDS_H
> +

[...]

> +
> +/**
> + * rmi_rec_aux_count() - Get number of auxiliary granules required
> + * @rd: PA of the RD
> + * @aux_count: Number of pages written to this pointer
                   ^^^^^^^^^^^^^^^
                   Number of granules
> + *
> + * A REC may require extra auxiliary pages to be delegated for the RMM to
                                         ^^^^^
                                         granules

> + * store metadata (not visible to the normal world) in. This function provides
> + * the number of pages that are required.
                     ^^^^^
                     granules
> + *
> + * Return: RMI return code
> + */
> +static inline int rmi_rec_aux_count(unsigned long rd, unsigned long *aux_count)
> +{
> +	struct arm_smccc_res res;
> +
> +	arm_smccc_1_1_invoke(SMC_RMI_REC_AUX_COUNT, rd, &res);
> +
> +	if (aux_count)
> +		*aux_count = res.a1;
> +	return res.a0;
> +}
> +
> +/**
> + * rmi_rec_create() - Create a REC
> + * @rd: PA of the RD
> + * @rec: PA of the target REC
> + * @params_ptr: PA of REC parameters
> + *
> + * Create a REC using the parameters specified in the struct rec_params pointed
> + * to by @params_ptr.
> + *
> + * Return: RMI return code
> + */
> +static inline int rmi_rec_create(unsigned long rd, unsigned long rec,
> +				 unsigned long params_ptr)
> +{
> +	struct arm_smccc_res res;
> +
> +	arm_smccc_1_1_invoke(SMC_RMI_REC_CREATE, rd, rec, params_ptr, &res);
> +
> +	return res.a0;
> +}
> +

'params_ptr' may be renamed to 'params'.


[...]
> +#endif /* __ASM_RMI_CMDS_H */

Thanks,
Gavin

