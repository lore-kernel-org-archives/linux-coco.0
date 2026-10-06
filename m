Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084AA2AE76
	for <linux-coco@lists.linux.dev>; Tue,  6 Oct 2026 02:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791252943; cv=none; b=tKfEh9YZWkZbip2zjf6vPZzt2bkTXQXofCAeghTTsEHJ+14jvxtOOvbi4w2Wx89RkGyX2RAizr6fkWE8xjpeKyEJcgK6jglL3UhDMueoAYPirId360E4eQ61ZOOlToPy5qBoKkpILAZJPLWlMXX7N/Zppz6wC3LxvvAds9cMahE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791252943; c=relaxed/simple;
	bh=Sx7g8hsp4aXStbrt4GpenXWJBZXKZdDVSxLF4rORla8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WCTBz2yyc61dzUUjMlRmKxrL8epN5nmHtNUz0G3yAYxDf9pQGQMKf0sofcI2S/Xvrbjt3BCbJR3idQCKag9sEtAaB5bU/g5ct1mFr4IbgwonjrqhO0XXm8RDL1/8D29heL3Wtwe77e71qcAq6tp6RO/SKXxlnAQCvUg/RiBbcPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G5WafGFc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G5WafGFc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791252940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nxIeuyPsGM6bXB1gP5y8RQMrIArazkFLfv1yfn+nqd8=;
	b=G5WafGFc4YOxYm28QAizVYszBFEn4sv1QLo7oCrIfdQc7/sRXo8JjaUU4dgWnF107SWaU6
	ycxNDdQ8msS8B0V+EJAgtMtWjtxqrBFeln8AYefp+0QSRBVgykGY744yeZQMuJyh8F4ivE
	lTmCNwD682IJ5DIsrMMuMqsujLf3Uks=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-107-qDYnDEFxP1KO1iNrmOHeAw-1; Mon, 05 Oct 2026 22:15:38 -0400
X-MC-Unique: qDYnDEFxP1KO1iNrmOHeAw-1
X-Mimecast-MFC-AGG-ID: qDYnDEFxP1KO1iNrmOHeAw_1791252938
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39deb05ef51so2312923a91.3
        for <linux-coco@lists.linux.dev>; Mon, 05 Oct 2026 19:15:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791252938; x=1791857738;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nxIeuyPsGM6bXB1gP5y8RQMrIArazkFLfv1yfn+nqd8=;
        b=AKCxbHz1YutLU+c2k6btaX9sRgaGi9b39YdzokV5B517osDrfOAlKJRp8G2yqt4y2I
         dXIZ29A2bpygmfzqqxI8jlt0GMCMFnYMvumsojdPcmq1zxy7fzSqDTnGYtKSN9SgdzCy
         i2dECScDXdNKvNr2Uo19nq65DeUmesfADqx6PZuUCEpyjbSy+ZQ/Bbq44TL5/mtJz5V9
         o3fJzZr4ipEug+mLSgtN5J7/AepRX1PpsDYPRK44Ja3o1YWOy/duod8pzg8cg3Z8Oxf7
         7UuUXrR6laIqFKCt97c2iYr5QyddDsK7e7cES6vF1A0vEdaqxQa+lOrJ+2PFV/yi6f0q
         HZcw==
X-Forwarded-Encrypted: i=1; AKwUvBwRK9IzIQ3dhck6nn+BIXIqQdONk96Pc2j2gzBmULCuEckgyzGVSUdgQBtbwbljQDwAzzEDn2Rye3NA@lists.linux.dev
X-Gm-Message-State: AFq9FYK5kTtIZBVUlJHhTAqOUAl7YXfogJ9pNJEEPSIK7SUCwQJJITCU
	5Qq7DWp0l/tBfikC1VlowlZ0qU2jSpSZtsnCAw1kwuRK98oNvJmljO5Eeztlbu4kOucjLCX6c27
	OgMJxXjFeshn+THOUlg0e3g6qUj8JGcq8P2nV2dqzdeY5A3H5pvIbt/kVAyjAEP0=
X-Gm-Gg: AYBFou2ia7r7xjqJTK05TpcXkvsHk8HJmy8gbRDXiKDKwZ+nNZoc3nNBOlXqHlag8w0
	XrqJs0idZ+LoIEGwv+ZTPCI1Yl0Hrawt1bwCkX0ttkXzYqUXfRy1ZXSirqhH3CMYArlxH2aJObw
	FWI1CJl6yixVxy5jWuIW+E12WYmlMF0bSB7wXFNxy0+8aHtDYmPCKiUDaQVBocjcGXaNKW+9sfd
	JYB+wayNuZ0NKgLorxsojppJcjR7tYTvOr/a5LF2WywEJxac9N2GLEfkimLCH4u+UsnvRt3+0nb
	1jXWq3aR+m/wXbSI5imY/6gRiQ+KGEWT2EMzjZyfhdeCwpzTXuz8S5QsCXUD6t0eTlVF11wBESo
	DuWB15GWKiBRkYGwRz0p3hcIwmYNOUl0dpzTSYdtovg==
X-Received: by 2002:a17:90b:3e86:b0:3a1:66fd:94af with SMTP id 98e67ed59e1d1-3a6ce7f67b5mr4922647a91.37.1791252937699;
        Mon, 05 Oct 2026 19:15:37 -0700 (PDT)
X-Received: by 2002:a17:90b:3e86:b0:3a1:66fd:94af with SMTP id 98e67ed59e1d1-3a6ce7f67b5mr4922621a91.37.1791252937271;
        Mon, 05 Oct 2026 19:15:37 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a7e4b00de6sm5404856a91.1.2026.10.05.19.15.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 19:15:36 -0700 (PDT)
Message-ID: <0f463e25-1536-473e-809e-6a358f27275f@redhat.com>
Date: Tue, 6 Oct 2026 12:15:27 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 08/23] KVM: arm64: Add vcpu load/put call backs for
 flavors
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
References: <20261005090754.2140522-1-suzuki.poulose@arm.com>
 <20261005090754.2140522-9-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20261005090754.2140522-9-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IEGnClaKdu7BNi-VVrkjLnSdgLeMIb_r8L9RVTpH7V0_1791252938
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/5/26 7:07 PM, Suzuki K Poulose wrote:
> Add VM flavor specific handlers for VCPU load/put, in an effort to make it
> easier to follow the code. pauth traps were removed from VMs running PKVM
> as it is a no-op for them.
> 
> Based on a patch by Marc Zyngier
> 
> Suggested-by: Marc Zyngier <maz@kernel.org>
> Tested-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> Changes since v21:
>   - Add '&' into the KVM_VCPU_OPS() macro
> ---
>   arch/arm64/include/asm/kvm_host.h |   6 ++
>   arch/arm64/kvm/arm.c              | 138 +++++++++++++++++++++++-------
>   2 files changed, 114 insertions(+), 30 deletions(-)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>

