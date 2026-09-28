Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1DA30F94B
	for <linux-coco@lists.linux.dev>; Mon, 28 Sep 2026 01:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790558847; cv=none; b=q1cTepYSiWpgyPcqf5V8e0aEuJoId10VzuYWz5W28hlwgLM1KffY5mqgaDEvUkLCnbSn/skfEACvLeJXQQPEXSHoMiO0JGWKHJhKLu+O6fDsfyvy7vLfGaoS5FQI2oH9DpB6/J5KTvhML2Pj/B2mLPX5+Cl6jVVRQ4CweptDMkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790558847; c=relaxed/simple;
	bh=rjaNAg+z04eA9ykYVMKBTQouCXeaLXvohfjJEkPN/as=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i2+H94IbQ0fAkg3uRYTxnm519hFpw3dVEUVqB6hExGpFj7eNSv9nQTsUQJsIiHX6SKkdw71wIokbpUxkY0b4ucWbzBt/zp2BT6wVzoZZc0cCMZ8xObp586SD59DRlNv6nXxep2T/F+x8SxH8oLTDkYKqW7ScORHt/uQU54k4i0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bQ4aPz5T; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bQ4aPz5T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790558845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5votifnwitH8Ds1fhrux91JN6J8KXmnO59qVNlCSXwA=;
	b=bQ4aPz5Tklr+4Jix+7lUH72KJKQ7MCx9AoASNuH6G3s3cLiFiAUqezNAiX8GTqR4lgmmoS
	QlDiRmPy+2XLfQz2mKnec6YdXrVqWqrAe7OopKbizNDqO65z/cC+usIjq/Z7hlkMVE8hr6
	Tqnd6+Tbc4L0aIo1o7USGNL2wn7/t9c=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-604-dp2hArgwOXmmR9Ld17KPdg-1; Sun, 27 Sep 2026 21:27:23 -0400
X-MC-Unique: dp2hArgwOXmmR9Ld17KPdg-1
X-Mimecast-MFC-AGG-ID: dp2hArgwOXmmR9Ld17KPdg_1790558843
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-882359f93ccso716156b3a.3
        for <linux-coco@lists.linux.dev>; Sun, 27 Sep 2026 18:27:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790558843; x=1791163643;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5votifnwitH8Ds1fhrux91JN6J8KXmnO59qVNlCSXwA=;
        b=a85SEWvx8pnHG0od0TIy5wG6TKmhyJGTkydubpaSCGEdE9A90SG/9N31HIyirj0X71
         g7hEYC93WpqKq9lc+VbxkIONw2G0iX2OrYzZq3TZudvlS8k8DKozrxn2ZaJ2nRSJthiy
         6p57mzg4+ILO8szFqDCcLBR7YH2kdFlXFXgKJWLZaIa8RBXq7jh0wJ9jNeQS61ondZjJ
         I+ToRGC4d9s1bM0+DFlcvkjDU53/UaezcdrUUtNE2S2GYTftJeefo2Hf+CAQNV9dka8S
         mQ0C3nH67uJldzrDIsqWB51hCs5jodgOcoVSOya6QRHQUGa+Q02w/0GZARMAoTDFotF8
         EWBA==
X-Forwarded-Encrypted: i=1; AKwUvBxSb7UFhox06PDdPDtDm2K4HcFecZGekZ4H+K8DmKrblVGaWTnoZ7Er5Fv7fgxdTOg0UhFD5L/J3LNA@lists.linux.dev
X-Gm-Message-State: AFuF++llMu5g+BMQOYghynyFKcxm46T9OdyvyGn11u3hadE2N9c+mlN0
	TRAw62bxma/blIUpFvZelssWE5Ejt1UWLk4FPKGAXcaHqUINS4ET1B57PNt1V28KFNxHv+avdOt
	LCBl4ualcTvMMz5d2PDUcQ0uzb69Bc4Beycrd9qAoLBikLqS+w3T8fb/OnWMZOl4=
X-Gm-Gg: AYBFou1o85feYL1PnxMPAs1CZVjMjkWTOG9TZScTNggvxQuMRgDpk0ZNQH2c/5FNxVb
	3zJuBjURi9hPvTYTfC2q7orRIDxIb+zisVy5/wB6V4o//3g1v+Q7Z8MvZJIDqZCM/yoT9Gzd9rl
	k+sTl2+lVEC87kknEOw0rIDjdA/fkWqLUQtM5dmcBt6vFMnvd73226+fmXETFQgFWT1+bc9wKsZ
	0SJAoLXHWEPGto2zL8cXFXeYCcya+ebnRP9fCSJ0I6d12Q6tDmWczdK1cmQ9Hg5fOW5kkg7I+1x
	qyZsw1IsUfDUxXxpJpHqW56B3CHqwE78aSEpTjuBeRhoskPufW5VaeuSXPCQkrF/moYI3ocHYa8
	3Mt9DPY6xtlR8WDAfaf64G8LIINQtRHd+G9KV1TR4/A==
X-Received: by 2002:a05:6a00:3d06:b0:869:c368:3675 with SMTP id d2e1a72fcca58-87e9aee4a61mr9245898b3a.17.1790558842694;
        Sun, 27 Sep 2026 18:27:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d06:b0:869:c368:3675 with SMTP id d2e1a72fcca58-87e9aee4a61mr9245873b3a.17.1790558842219;
        Sun, 27 Sep 2026 18:27:22 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-882d579ca0dsm907806b3a.21.2026.09.27.18.27.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 18:27:21 -0700 (PDT)
Message-ID: <2c7a9780-1846-4b5d-b743-42ee1bfdda22@redhat.com>
Date: Mon, 28 Sep 2026 11:27:14 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 14/20] KVM: arm64: CCA: Add bare minimal S2 operations
 for Realm
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
 <20260920212845.707-15-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260920212845.707-15-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rqRedg_KaWnuQfSNb3f7UNfPoFqqQyOS6nlA2fUqklI_1790558843
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/21/26 7:28 AM, Suzuki K Poulose wrote:
> Add bare minimal MMU operation hooks for Realms. The mem_abort handling
> is chosen as the default KVM variant. However this cannot be reached for
> Realms yet and we would need real RMI command support to make it fully
> functional.
> 
> RMM takes care of the TLB flushing as required, when the Stage2 is
> modified. So host doesn't need to do anything explicitly. RMM doesn't
> support access flags for the stage2, even for the shared IPA.
> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>   arch/arm64/kvm/mmu.c | 24 ++++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

