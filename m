Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D712139B6
	for <linux-coco@lists.linux.dev>; Thu,  1 May 2025 02:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746068114; cv=none; b=bdeNaL4CGg9uRGm5OYNadmJCOmXKRUVU2eVjYpfWcUpPeHYsjI/piVvCeedtThonmLpsQAR3CUct20umYiF4MYLx5LuoyWu6/XFNJ8f1LZUolnjh0ba/KlFYSAgxUMMwuOBKYPX0ePDFdLumNwNONJJjpTx8irZxUvaWtWH/Oa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746068114; c=relaxed/simple;
	bh=E58/Ir3nEphDsEt/8roe/A0l6EH+/+K6JbtT6e73W70=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XREKB6DVZlKDuafJcNosVIGRw+uxyOWZiWZM26T3Ih/aHuHO0wHUB2/Hpna2TaRdHbaeu+m4blcaifuOyc9LrDdj8R2HGOdcAPBpkRb+s3sSOg6kB4Pp1zJ8sZFDJZaJWFJh9fqbSKLAr7kc0/a5v0T91NkHYUFC4FVlDnZOAwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LgKxJBlV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LgKxJBlV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746068111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O0f0P0r46I4wQ1N14Wr4dQIPr/ky0+9o8c+Aikg6Uic=;
	b=LgKxJBlVJEzOSMcyBt3gOG1eYBY3oWbjf9b55cBqgfly6gqec6XPDppZ8GOB62fA4i2i2j
	maqRDc9tjcD/ejF8TI7KSUHD/J4ThTHpWrgogK/2AqEkBSc6FfRUtHgXARXXOqEHBd4f09
	eQ4n6x+hLhw4218IbC9PWyAl4cf4h+A=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-15-nJRlUawnNxilIpALT6ap4Q-1; Wed, 30 Apr 2025 22:55:09 -0400
X-MC-Unique: nJRlUawnNxilIpALT6ap4Q-1
X-Mimecast-MFC-AGG-ID: nJRlUawnNxilIpALT6ap4Q_1746068109
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-739764217ecso526331b3a.0
        for <linux-coco@lists.linux.dev>; Wed, 30 Apr 2025 19:55:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746068108; x=1746672908;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O0f0P0r46I4wQ1N14Wr4dQIPr/ky0+9o8c+Aikg6Uic=;
        b=rEDI9JWRNc8fK+lz4ARvkm0uV5fXbKbi/JWkJAX8x9r+iMVqfBl8Jw9o6wn7d+3RFl
         IAVVEkYeCVqxal+4pNc2fBUBUSGBke5p1Fr5Uu6/qrvZpC2bj0JPJcphPGnoVZp4vnrh
         b6+2jdRDoogOtqt1Gw5F9nwkKu2YtbokJ2Ld9UGQalKFD+ztl4TxlnNaDVpCvqb5icON
         7AVKbcHjKzEg4l6OZaSkZxxXXfHVeLf84LwYoAfp6uTZUqWdEpNnEviC3VH1sx9GDS4f
         EiyU4Jul7x9HhyJYWgPPg0mYYxaBas3Qpfq1zR/uOtyjGAA969ap48OcHbWoqrMpMKKc
         3jIw==
X-Forwarded-Encrypted: i=1; AJvYcCUzzKqkvV3xg+Nuy31AufhmLCc7Ga4d3o/RhMghVnuSU2Y1XKVJN0Dypwv2Ic0+C66GPQm5phD9LKhT@lists.linux.dev
X-Gm-Message-State: AOJu0YxCDWAuqOMDxI8T974f0ydgbZdgIZufVqspeBqSU5QlFGFAwQ/8
	GQgVV7dCgCK2lf50C1Tza4EQBboEBKDMX2JfXd4MOu8hE9Sh9+PE7AJCNRca3QPkU5Thhh6jbF2
	60c/c9z4qJa5mcHKj2J5SeV8sL+nAoP8NX1VtySHus6CecalfrLvPUsJxmXY=
X-Gm-Gg: ASbGnct6+GV9UTf5/jcWSOsnOqN3qRSGkKywvbCt31stC+eoVZIZUVL8+noein99hPm
	z+3N4VMR0Cxcv1I1Tj7/s3lbxISxgkWgH2weHfBwbNBcKMYJRGoUAIHE/PAPsKPOAdK3pCEnB0F
	nyTeUDe7AvnuIPxxNmfRtGSP97usk7fkTB9Qd2z6AJ0l0w0xEsZRJDXqJiVExmY5H0rjS2B/qS9
	LagD7steKo/GplvXsb6Kf6Qjodw3eqHHn6Pck5ryXFjvT0COy01Q82mXJX9E4ZYTFsBSyFUhcaf
	kX0avhORGzO6
X-Received: by 2002:a05:6a00:35c8:b0:736:bced:f4cf with SMTP id d2e1a72fcca58-7404927930fmr1396641b3a.0.1746068108749;
        Wed, 30 Apr 2025 19:55:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFylzKnp6diohi3udmCDZ47tP/kvpo9wyUKWLV/9Fl+cS6PnVhqYmglGK+RzeWLQDfWNo9YJQ==
X-Received: by 2002:a05:6a00:35c8:b0:736:bced:f4cf with SMTP id d2e1a72fcca58-7404927930fmr1396611b3a.0.1746068108438;
        Wed, 30 Apr 2025 19:55:08 -0700 (PDT)
Received: from [192.168.68.51] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74039a60016sm2536538b3a.133.2025.04.30.19.55.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 19:55:07 -0700 (PDT)
Message-ID: <770205d5-8c08-497d-b862-1be4852ae665@redhat.com>
Date: Thu, 1 May 2025 12:54:59 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 22/43] KVM: arm64: Validate register access for a Realm
 VM
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
References: <20250416134208.383984-1-steven.price@arm.com>
 <20250416134208.383984-23-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250416134208.383984-23-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: x7_6D_7B0YEXk1-qO-zLB-q21wtZTGD4W3LC4BjqSWY_1746068109
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/16/25 11:41 PM, Steven Price wrote:
> The RMM only allows setting the GPRS (x0-x30) and PC for a realm
> guest. Check this in kvm_arm_set_reg() so that the VMM can receive a
> suitable error return if other registers are written to.
> 
> The RMM makes similar restrictions for reading of the guest's registers
> (this is *confidential* compute after all), however we don't impose the
> restriction here. This allows the VMM to read (stale) values from the
> registers which might be useful to read back the initial values even if
> the RMM doesn't provide the latest version. For migration of a realm VM,
> a new interface will be needed so that the VMM can receive an
> (encrypted) blob of the VM's state.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v5:
>   * Upper GPRS can be set as part of a HOST_CALL return, so fix up the
>     test to allow them.
> ---
>   arch/arm64/kvm/guest.c | 40 ++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 40 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

