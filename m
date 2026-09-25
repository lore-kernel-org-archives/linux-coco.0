Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7202D7BF
	for <linux-coco@lists.linux.dev>; Fri, 25 Sep 2026 00:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790294867; cv=none; b=Wwqzb9ZUj9idCRuh5uqr1MpbWFhhchPtMBNA2D8nZVWkar3QY75/FvdudDfha5/S3RFMQ8REv7g76NkR6dsaoRA80pOCwrJLcgcYKa8bNMDH0HJfC0WDWiuXom7IgDHq8hMc9K9pUTUvJzJBovBa2oESufAMviy8GtwlFBM3ARw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790294867; c=relaxed/simple;
	bh=MfzCj5n/qzaDRiZjBdIWIPdLsqB/Z8mKb7SNpeiywnE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ACQRfGahsH92fruQyQsMfRqD5zVoNq0aG4szz3sm3OCAMOdrvDHeFHEQpx7gRo0c54Y8aF1TSmPG8odlzMcM/NI2t4MHW99WRON7wU9G5RKcxhz9iUl/b8seKCgppiF1OI+204u8BAPpR1TIUU4sB5TmZZVxtgFchR6Ase0T7qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F3awLiiB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F3awLiiB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790294865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QtjK9f50/jK8SHecvHOqY5pCCQhpN2otdhXEwvLzMjs=;
	b=F3awLiiBniggHGjUD8BAJfzOzOFE9VrPiYefLhSvcIuJ5/TMVOWNqTfsueWn1c3PqhQ8oa
	3B3rdmOMeMonmuVcvPHG9hf+67XUp/DAr/f58F7s+2tHnrlCovmGH6hCNDXW47zBcUWmJY
	SOEjdJ6UqEFUlU+C5zalai+n5LPreqA=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-310-QgKAc4MsNNyuyEpvPzxhgA-1; Thu, 24 Sep 2026 20:07:43 -0400
X-MC-Unique: QgKAc4MsNNyuyEpvPzxhgA-1
X-Mimecast-MFC-AGG-ID: QgKAc4MsNNyuyEpvPzxhgA_1790294863
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so712768a91.1
        for <linux-coco@lists.linux.dev>; Thu, 24 Sep 2026 17:07:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790294862; x=1790899662;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QtjK9f50/jK8SHecvHOqY5pCCQhpN2otdhXEwvLzMjs=;
        b=lo3htqLrinEa3kts4uUyyoKxpeRAp025bljfjfhAaohw/+jU5099JxI1wsBATEaUiz
         1EwHAC5GFJME7sZPiUOmXwlOS1j9o/lUKN1lJ3PqPcpp3FgHhOkFKseRijw9F5kbfsK1
         BqUYMCqWxA6+xOkRSh6s7n1DVPDSWX1T83feyYGSZ7rCbHfe3wzp2tZNbnC2UMogFD2k
         bk6HM39zW6nrNyoFTrEkgROB8rJxIu/zA20obRG4r9BWE0qaojUC2qAEcytEFUicOH8K
         Zqm5rabfWGgQS5G8rfq+uS87LP+yiU8MMRtw6yQff/fO1BEel4TNY2FYAza/ObTLkX/a
         spDQ==
X-Forwarded-Encrypted: i=1; AKwUvBw0PJDG/6QRBtPk492bOMxmGTD4hmVYgwbVgyqzlbXu+SSh/efoVjBHgcT2gOKnnwYogwm/xSvVM2ak@lists.linux.dev
X-Gm-Message-State: AFuF++nxxPF3IYkTJ9EYr4KTmJsfdfMDw17Vrdsli1NJy3qxZOnYbBl5
	39hYJxAxPELNPWDenSemt8ISQVIq0EGT8JTZ6ZkPrCyVlMWapuYbyzTsLxFvqjnuZQCEqnP4xo3
	5grrflRyxM4ePNAM3VwB+QDRt/lOFmJzbhDjEDCx59g8/hULV0FmgAooj1EBcli0=
X-Gm-Gg: AYBFou1t0RYjyo8p/plOeNyGo24IKiuinU7N+42JvKgwt94KJbfzcJp0hMaQSttF+Tf
	b+eSECFX1zNjOCIGeDIrtmbs7Sw1hvGimmUI/2m47IjzlQPTwvSaFMCdze0eDnC6jr3h5QKkcm3
	xT6+WSclIAD8hXdMYeD7+AC0cilaIDWRBCbGhNeb9xBVgpQeeDdTjLzHyYX5QRAI5a9SvlIQgwA
	hFqHF2t9El/QleHQ6bzIi/9Exhze+RRxLbPZpgIfLy9XHt6wcOuppXbssq1vJDxmEBR4Dy1DP3g
	t9wWWpsmHUjcYYcGqAovBF9i+RrmzOzizfBcYJ442W2svIohtMUXDjaRHMkQFDH8am94BuHzEvH
	8tPv+wp8kGwOAZo2zsOV9Q2acJ+faL7iZJGdPSraozA==
X-Received: by 2002:a17:90b:49:b0:3a0:9ed5:5420 with SMTP id 98e67ed59e1d1-3a0bb6139bdmr380646a91.44.1790294862451;
        Thu, 24 Sep 2026 17:07:42 -0700 (PDT)
X-Received: by 2002:a17:90b:49:b0:3a0:9ed5:5420 with SMTP id 98e67ed59e1d1-3a0bb6139bdmr380627a91.44.1790294861906;
        Thu, 24 Sep 2026 17:07:41 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b9355e49sm997611a91.4.2026.09.24.17.07.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 17:07:41 -0700 (PDT)
Message-ID: <a3984ac2-ca04-4e46-87e9-6277491acf7c@redhat.com>
Date: Fri, 25 Sep 2026 10:07:34 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 6/7] firmware: arm_rmm: Ensure the RMM has GPT entries
 for memory
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
References: <20260924135201.850038-1-suzuki.poulose@arm.com>
 <20260924135201.850038-7-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260924135201.850038-7-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: q43jgOUW2Qo5xV1ZRpz7z_Jo10YYtjBl4k3Ta0JSDpM_1790294863
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/24/26 11:52 PM, Suzuki K Poulose wrote:
> From: Steven Price <steven.price@arm.com>
> 
> The RMM maintains the state of all the granules in the system to make
> sure that the host is abiding by the rules. This state can be maintained
> at different granularity, per page (TRACKING_FINE) or per region
> (TRACKING_COARSE or TRACKING_INTERMEDIATE). The region size depends on the
> underlying "RMI_GRANULE_SIZE". For a "coarse"/"intermediate" region,
> all pages in the region must be of the same state, this implies we need to
> have "fine" tracking for DRAM, so that we can delegate individual pages.
> 
> For now we only support a statically carved out memory for tracking
> granules for the "fine" regions. This can be extended in the future to
> allow modifying the tracking granularity and remove the need for a
> static allocation by the firmware.
> 
> Similarly, the firmware may create L0 GPT entries describing the total
> address space. But if we change the "PAS" (Physical Address Space) of a
> granule, then the firmware may need to create L1 tables to track the PAS
> at a finer granularity. Linux therefore checks if the platform firmware
> manages the PAR region. i.e., the firmware is in charge of managing the
> L1 GPTs (creation and the required memory for the GPT tables - via static
> carveouts) without host intervention. Support for dynamic GPT creation by
> the host will be added later.
> 
> If the firmware requires us to manage the tracking or GPT memory,
> deactivate the RMM and reclaim any memory donated at RMM activation.
> 
> Apply the same checks when hotplugged memory is brought online.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> [ Switch to RMI_GPT_L1_INFO for checking GPTs and deactivate RMM ]
> Co-developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>   Changes since v19:
>       * Avoid mixing gotos with __free cleanups for arm64_init_rmi()
>   Changes since v18:
>       * Handle buggy RMM to make forward progress for RMI_GPT_INFO and
>         RMI_GRANULE_TRACKING_GET
>       * Make sure the memory ranges are not inverted and reject such ranges.
>       * Move granule_tracking_get/gpt_info wrappers closer to the callers
>         Drop "inline", let the compiler do its job
>   Changes since v17:
>       * Move wrappers that may not be used elsewhere, out of arm-rmi-cmds.h
>   Changes since v16:
>       * Check fine tracking and create L1 GPTs for hotplug-added memory.
>       * Clarify the L1 GPT setup and move the explanatory comment.
>       * Switch to using RMI_GPT_INFO command for checking the GPTs.
>       * Deactivate the RMM and reclaim the memory if we can't proceed.
>   Changes since v15:
>       * Skip firmware-reserved NOMAP memory in rmi_init_metadata()
>       * Handle negative error codes from wrappers.
>   Changes since v14:
>       * Move the implementation into drivers/firmware/arm_rmm.
>   Changes since v13:
>       * Moved out of KVM
> ---
>   drivers/firmware/arm_rmm/rmi.c | 218 ++++++++++++++++++++++++++++++++-
>   include/linux/arm-rmi-cmds.h   |   2 +
>   2 files changed, 219 insertions(+), 1 deletion(-)
> 

With Jonathan's comments addressed:

Reviewed-by: Gavin Shan <gshan@redhat.com>

Thanks,
Gavin

