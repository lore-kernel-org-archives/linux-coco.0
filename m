Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6433158545
	for <linux-coco@lists.linux.dev>; Thu,  1 May 2025 03:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746070859; cv=none; b=QPmEI1kTNvjEXukNu1e8Qcg6SrtRNXs5xSqwHQVYmlWxm9IhCKtrzc8NMPNbg5XEyoX1J09/QAmr3NKpGvqRMplqu8N1CVWLxsjoTXGhTbz0paH/qK8KIFpiezBrsPX445BERmby8bBrQ1/pSyoJc1Ok4X9erjtoBwVhm/WlGcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746070859; c=relaxed/simple;
	bh=bh50DBjTplxiLTSZLJtA78HDHGJdoYyqa23SgjBMZaQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iPN5PKpnFsbiJT+WjLIF14JfpeUqZ5Zb4r4pdGJz82wIRRuTxbim4xUx5gWVGVUgXRYRyL9W1CWGetafRHSjMM5kGCnaFcttgip1kJNvQbQVa8QRN7XlBcpUaKT6celMpIbDMUsMyHpWyyTw8dO9L8Hqe4/hxvgVp/RbFWjWciA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g1nldZIP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g1nldZIP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746070856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TBzfpKZnt5CxAomKzEA1Dj2dpRWqVssdq1NJBzT2e30=;
	b=g1nldZIPuoOCTXcHfX71pL5QYQTEEOQIDxV8bzSKCr7m0qoPY0wFTYAwn1D9RANQfrZ37C
	enZ6Z/riKoBHvwwVSVpPR4rv7c7EHLh5svTPyNUAMF0rIdZeNNejMXRAgffOsB02vQ/Vdh
	ukLkAwmZ3zTHrcBqnfeeOAKSHSwJJb0=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-78-pSVgI2XMPcemCaX5OnCOQg-1; Wed, 30 Apr 2025 23:40:55 -0400
X-MC-Unique: pSVgI2XMPcemCaX5OnCOQg-1
X-Mimecast-MFC-AGG-ID: pSVgI2XMPcemCaX5OnCOQg_1746070854
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-af59547f55bso330255a12.0
        for <linux-coco@lists.linux.dev>; Wed, 30 Apr 2025 20:40:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746070854; x=1746675654;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TBzfpKZnt5CxAomKzEA1Dj2dpRWqVssdq1NJBzT2e30=;
        b=eQ1OUifYfRF13CD76xzje/LMncPZQWqhS3wvnZ6Iz5eagZLzWkswbo9cvJVZfKGiUH
         UxFRIX4I7HBTg/pix7g9T8R/Q6ya28VBcZ7H8UOwxYChYnwdphsamSlWdE4BZyyY7wdh
         uCYZ6KGzeDeB5KfmcxmkS2Y8sS8o4HQNe1lZEdR57J1EbYfV0EkwPn4K8sjWsSCVhM9V
         u91TNSpGVcb1piQwGjPwUDsiUUqf+55k8Q0lI71uPXRu5Q4vq3LosYbcnexJAiQvXYRN
         WrsvMJ7n4N0c6dIo7rjhYchvQO8ogZ7cxCcJ8qsDaYdQLECwTo7oxMEfeuml44rUSna0
         aJsw==
X-Forwarded-Encrypted: i=1; AJvYcCW5SD5Af6wLS923+rCFX3lfU2Q1bciH+ZdmXii4n/ZvzcTY5uchs7bWMCgpk9LD9uXMedfiT2w98Ou5@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/bMlGBe9C3rDZAnJoDqqiwn/vPDmHyy2g92dg/YxIym5T/GnD
	BLRKjAzNikLIWkVr1Y28d1M3+u7UExM4aGpCjZ4r2U21Rc7w2yhBHV5zSMLK2jbcSOlHKVHjyru
	1VAOkxGODoFX/niZhDcEplCWSfMiTU1X4SES9+V52YMUushav4CX3KHl9lnk=
X-Gm-Gg: ASbGncvzXho3feGBkdCLZcgw66n5M9x8OazSRCtJaBN5BgHnjbYwfWDxyW0kgMg4k4V
	Ry0Srxm6GZoQlO2wQ11LUQ9/SnVcR2/XvdqUiiwxwrnP/on7z0zUR/eCyagKX1WA7AsB1afG00t
	ERGPfUgPafKWFxuiLKt3uzUZ1O0iFzx2RE+7B9p1uCWX3NR/jobrUvqB0+sIej/Jt610HNpVKfH
	L++BucoidW64lerVHqlRiZV27PEn3SZSrTt8lzj/drsVEyZ00j9d/bTxCiQFrbMoHhk5/nV2ArQ
	F5kEP7ll/cCU
X-Received: by 2002:a05:6a21:1788:b0:201:4061:bd94 with SMTP id adf61e73a8af0-20ba74f9efemr2316698637.19.1746070854027;
        Wed, 30 Apr 2025 20:40:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcdCIV/XU+3thu81d9MiACXjb+DjhRRhcxhdfe4+xkJBBdN6cJ+Wf09/OtaoBNYxBmSezekg==
X-Received: by 2002:a05:6a21:1788:b0:201:4061:bd94 with SMTP id adf61e73a8af0-20ba74f9efemr2316662637.19.1746070853706;
        Wed, 30 Apr 2025 20:40:53 -0700 (PDT)
Received: from [192.168.68.51] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74039a2e75fsm2624953b3a.98.2025.04.30.20.40.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 20:40:53 -0700 (PDT)
Message-ID: <0be0479c-13d8-4fc9-9128-a3d414392a5b@redhat.com>
Date: Thu, 1 May 2025 13:40:45 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 34/43] arm64: RME: Propagate number of breakpoints and
 watchpoints to userspace
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
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
References: <20250416134208.383984-1-steven.price@arm.com>
 <20250416134208.383984-35-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250416134208.383984-35-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Oj1AB5Yced4tQ8SEte9LpcyRbDjFA3rW6th3OkrpU1I_1746070854
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/16/25 11:41 PM, Steven Price wrote:
> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> 
> The RMM describes the maximum number of BPs/WPs available to the guest
> in the Feature Register 0. Propagate those numbers into ID_AA64DFR0_EL1,
> which is visible to userspace. A VMM needs this information in order to
> set up realm parameters.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>   arch/arm64/include/asm/kvm_rme.h |  2 ++
>   arch/arm64/kvm/rme.c             | 22 ++++++++++++++++++++++
>   arch/arm64/kvm/sys_regs.c        |  2 +-
>   3 files changed, 25 insertions(+), 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

