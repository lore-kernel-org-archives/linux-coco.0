Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F801C5F27
	for <linux-coco@lists.linux.dev>; Tue,  6 Oct 2026 03:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791256738; cv=none; b=ERx8izdHWZMDqiVBigMK3ZQYvJTYJ5SLS8MnVYoLiiMsZC9X5hh93do03v3K7QAEh5xHIE8AsTnF/H8j2jdJuq5k5y0W1fz7xHyF71fg4o6CVlsTYm+wYum3nmfHJVJ7SXljyZG1k1tVfd8jX9NAgwqgEDcyM2HVNAdcXTCPGYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791256738; c=relaxed/simple;
	bh=ZVbjw66CG6A5xcmMat7LXv1MIDZBEKIeNvSdl57psXU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JrTKrFf4DOvSDNyhJ8pyqYj83mEZKQR7Gv5eBLzsLwY4dN3RPZvxz8JBCVNE+9EcMNOIspGUvOkpP7kj1xBpuI3k3OmdyxoLwYgJzc01hfs73/qWbC6fOt9pcFjgQV3Eun8oyEk7q6O0pbE3qN6/rnYxSQAfwSd1ft6Lp4QBccs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hm9nEvHL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hm9nEvHL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791256735;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1jMiWdjITXmdV/ikrHHf6jmvGBH/AsJXpXasV0+qQL8=;
	b=hm9nEvHLnYSPXfDzpndbnS+8qfFq0JSqamB/V1S6aXkuZUPwsSAJ8D3D2Ss8qWkUJXjo6Y
	Qm0DN0vUy1gaHBugdWe4fsSUDPCojs2rt/Eza5jMdpniM/wXgfFUZd5Ukghs66MsHFnnMH
	1GqxKcH0IAt3bz79LLZngKHckQwULl0=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-201-ej7J__DINum_YOfOSyiobg-1; Mon, 05 Oct 2026 23:18:54 -0400
X-MC-Unique: ej7J__DINum_YOfOSyiobg-1
X-Mimecast-MFC-AGG-ID: ej7J__DINum_YOfOSyiobg_1791256733
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cec4226c70so22604595ad.1
        for <linux-coco@lists.linux.dev>; Mon, 05 Oct 2026 20:18:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791256733; x=1791861533;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1jMiWdjITXmdV/ikrHHf6jmvGBH/AsJXpXasV0+qQL8=;
        b=e4K9cG5MrepVvK5EzlzOIoKUiymMjy840gIcJpV0+OKThbcrvfyO221AxX4d+LKZ4o
         n3ATc3WEbgz/YpYHtpNogMIrIkb58+PqPDuAbirZfaCLHdZi7qTK9rg3zWfZPrX3X8Rq
         83JgopmReakInRATGmZUga7hy4p3dHlhNrBNP3bdg/4d/rTcTgX0nISD/N7dW8RaWOIF
         FquBqc7uoQjthdLY0PpgCZQtSiw+8GHGOdKwGT5SF5OHhjoc/0Foi7iMjtPCFOQx4UD9
         rkAVYcqSzFIJijpNOQ1t0n1qplw2FpsoHKRGiHFrTtTpReRVWVZGorjeQpUnXGm6Ek6S
         lTbA==
X-Forwarded-Encrypted: i=1; AKwUvBxIp+UJasJZJsLVOgKQUFOQ+3PK5IWNB3pSxf9Q6ZJ07c5xpa/PW745qHqlVTmEQgv3XgyhsUw0Mg5d@lists.linux.dev
X-Gm-Message-State: AFq9FYIxDQkWuPJup1x24KM0mqIwIbkh9vSu/Lpt/TN5utuWWRGHWd+J
	SK54ecqVDBp8LErw8nzHu93tyv8fGAxITP5x+o+hUniG22A9lSv3yxRl4rBhzWuHNeUwjUFhJ8p
	ugn8BNBna1GrKQknA9W/ZGbjrvGGulp9yMEqCmPsqikQhd8mS2lI0oLQYoaxW/cM=
X-Gm-Gg: AYBFou1Vo1XLOKLpydC+5h+2AlHOmI4SwsCHmrVWXAFa9q1+apqtFsm2BefMDGYRm9Z
	znmNycHSC/wWJScYiMmTSkBIyeBlTJRCvwf67IkVNiV+dbjNHr9nJd+ue7Wq6WbfsbP+E2f6UJ8
	Fh4GUSPpfZ9brbxVgysaNj18MNdleFwLf2ljG0tTv5rWeJ5eyeUI+kcyXWukpyUfgw88uJtqcnG
	sfeaWEXkU78ZOLmPHMJ+dCggT20uUAP4J+ex26QuGwasxwMjF2C/mMdP6yF07JkSiJQhVf0QDfd
	xn5rgCOopTS6MM20geYsQLnNVQvyO7t/GNMmh3iW4M0+CTLUtjyCdbba5pDM2zLKqBHF0DlrC2B
	kFc4DvefBCvAHNCZcmcUlNXD8Vhdeajn0GTsuZ6wJ/g==
X-Received: by 2002:a17:902:c952:b0:2e2:dc54:3148 with SMTP id d9443c01a7336-2e5dcdbe031mr1348485ad.66.1791256733326;
        Mon, 05 Oct 2026 20:18:53 -0700 (PDT)
X-Received: by 2002:a17:902:c952:b0:2e2:dc54:3148 with SMTP id d9443c01a7336-2e5dcdbe031mr1348145ad.66.1791256732898;
        Mon, 05 Oct 2026 20:18:52 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5a5ecf461sm15865645ad.53.2026.10.05.20.18.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 20:18:51 -0700 (PDT)
Message-ID: <e556089c-18bf-44c2-8b94-3c558b0398db@redhat.com>
Date: Tue, 6 Oct 2026 13:18:42 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 17/23] KVM: arm64: CCA: Add bare minimal S2 operations
 for Realm
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
 <20261005090754.2140522-18-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20261005090754.2140522-18-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZuKQsGpuYnT6G3i-CsIatbHJUvSUQ_AQj2rSuRtX-hI_1791256733
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/5/26 7:07 PM, Suzuki K Poulose wrote:
> Add bare minimal MMU operation hooks for Realms. The mem_abort handling
> is chosen as the default KVM variant. However this cannot be reached for
> Realms yet and we would need real RMI command support to make it fully
> functional. Similarly, unmapping stage2 requires RMI command support.
> Until then reuse follow protected pKVM hook and ignore unmapping.
> This will be addressed in the later series.
> 
> RMM takes care of the TLB flushing as required, when the Stage2 is
> modified. So host doesn't need to do anything explicitly. RMM doesn't
> support access flags for the stage2, even for the shared IPA.
> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> Changes since v21:
>   - Reuse no_age_gfn for Realms. Also use no_stage2_unmap_range for
>     now, until we get proper RMI backed driver.
> ---
>   arch/arm64/kvm/mmu.c | 23 +++++++++++++++++++++++
>   1 file changed, 23 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

