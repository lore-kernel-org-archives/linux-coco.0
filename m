Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2B3C8DF
	for <linux-coco@lists.linux.dev>; Sun,  2 Feb 2025 07:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738480382; cv=none; b=H3ahsnSFmdcd8k7KcGojE3QlxDldmn3WogV3rlmmG1S04QZwjDzsh8Q9fhYDgeJOxnkCnVClReYHIoGHw8BZMuPZReH1d5USt2++pQI2wX6oZVIp5WeHq6//wS4P4oy08Cs7azDveW3aIZTpQ6WAwK/QeQJbTpnYdFF2vd2cFXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738480382; c=relaxed/simple;
	bh=CXPd9+3PCf0ABtxW27kGa+FmX6LrCMM7KEngRhxn1qQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ORDwbztN+8+TQBcDv7o7TS5fDiQ3SL5h2g1phCE2aQOjlSBXwfJrUzWICOigVwAvBsfPZSbSajCjsoPcazjojSNKdtWm3DN/VqqOh7BAxL9g6/MZxZS7SRSioCWF1xCemrZRze4zeo1MDZxM/4gz8Bc8v5m5UOx0uePCWl8ZTOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P3qpzfyg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P3qpzfyg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738480379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Akyo3JQj2YPzoJhRHm4ECXXW4B+Mshy1bBF/6XTbeo=;
	b=P3qpzfygaiXxKoeCkb4wsYkR+uLSJSPUGgGbokY7OKHieb4fZMZ6jQ8ke6Fv8mTrptKXlg
	1IuToXfXZU4v8Goufp20FLTFSNXfvpKpu94bjaYw54bNxniitr397P+EZkCdTZ2ieaRvw3
	viBzaJHoFv/HNu6WoiDNchbZrxGp3dU=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-533-C0SBCngZOHCAzIh17vqxCA-1; Sun, 02 Feb 2025 02:12:58 -0500
X-MC-Unique: C0SBCngZOHCAzIh17vqxCA-1
X-Mimecast-MFC-AGG-ID: C0SBCngZOHCAzIh17vqxCA
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2161d5b3eb5so65136115ad.3
        for <linux-coco@lists.linux.dev>; Sat, 01 Feb 2025 23:12:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738480377; x=1739085177;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+Akyo3JQj2YPzoJhRHm4ECXXW4B+Mshy1bBF/6XTbeo=;
        b=hGoP8MDH8w0H6QZe+3LxJ3PxRef7CoU0DziXjNDsJ9G/1ndvM1qo8/NdvYamzyxiqD
         22NjspX1ozFP3f8ICGkVEKUuUTsTRTOwU7MUwyjeWq/q6SzCJwgP9DwLLTugyOtvTcdD
         3FQxjT4Uj5bModFsobQPZHmG8/BNzo6EoARHU0iQk/rbWFTO0Q8oyga2iiAaolplu3WI
         ONfYWn4d8mndEXvZYcWXDNBCoisGwJIak+5NxExgWR1eJtMpuXHbWVPF/1ZF3Hdlzijm
         BFY5XZ94wRcgXDO3fpJQ9GOST3VzQDX7zZHI/HPy+u8/jen8UkwLDxo/6eYiwp1lX2UW
         zg4w==
X-Forwarded-Encrypted: i=1; AJvYcCX3KciDRD0Fnj6E3YczODSdmSkYED00MOnevEFtFZRWINoBej2yppgFy18uioBFmpkuWzPryc9egyyr@lists.linux.dev
X-Gm-Message-State: AOJu0YwmSsHSEI70WeAUHQIEPnX4ltSp09JUrCP9dyWPHzIBM9LCR5YK
	heEOcKes9spi2FVdz6ZWTpA+m49chasaPHMmcPRXKYfHQgA/hT+KRJ8V4kzKJ0euH5Ajx+oflUM
	bpATbwEcieYuqOMLvtVSV+oJtXQzPAh/RFTPdO9miuNmHjsLyvBmi22UoTd8=
X-Gm-Gg: ASbGnctZ/VZs8Z+758RlQEgCuD5zPGaavDKHk03ifdU2acZiHxTiWAp80YHH7o0Y3zW
	KpnJRZXcrSaxgKdTzKd6EAg7byNMn4/zAlq5wiXDNf/cCbx0nhp2zEu+UwpjB6lCk2DU/QURpKP
	JpcWKFfOFcGVkfFmoZOKrV30nmZpqPCSDZQ6faqtDHHIuaSTNem8sTh6C3nBtsGLuJqEtPR4ygo
	hx9QZmuKVOB41qpPreJWcCdf3CfyTULeE4Wlh6BsVHsAmh4SoEGPBxWRE1OIb4O7pgU6rm1n3Tm
	B0rhKA==
X-Received: by 2002:a17:903:110c:b0:216:1ad2:1d5 with SMTP id d9443c01a7336-21dd7deebd1mr265357475ad.41.1738480377004;
        Sat, 01 Feb 2025 23:12:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEEbEpN4KQNQWRi1soSDL1v4OtYLgM2DYDPCY0eEgB/YujTFWmFABLlbkBOcGlGdKwPsn62yg==
X-Received: by 2002:a17:903:110c:b0:216:1ad2:1d5 with SMTP id d9443c01a7336-21dd7deebd1mr265357095ad.41.1738480376627;
        Sat, 01 Feb 2025 23:12:56 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de32ea5f1sm54843395ad.130.2025.02.01.23.12.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Feb 2025 23:12:56 -0800 (PST)
Message-ID: <f339729a-00a8-40b5-af05-f0f019579e5e@redhat.com>
Date: Sun, 2 Feb 2025 17:12:48 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 30/43] arm64: rme: Prevent Device mappings for Realms
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
References: <20241212155610.76522-1-steven.price@arm.com>
 <20241212155610.76522-31-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20241212155610.76522-31-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ook6PBUQh63RGsx6IkQMonUzlNhaWstpuK1Tzo2yAB8_1738480377
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/13/24 1:55 AM, Steven Price wrote:
> Physical device assignment is not yet supported by the RMM, so it
> doesn't make much sense to allow device mappings within the realm.
> Prevent them when the guest is a realm.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes from v5:
>   * Also prevent accesses in user_mem_abort()
> ---
>   arch/arm64/kvm/mmu.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 9ede143ccef1..cef7c3dcbf99 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1149,6 +1149,10 @@ int kvm_phys_addr_ioremap(struct kvm *kvm, phys_addr_t guest_ipa,
>   	if (is_protected_kvm_enabled())
>   		return -EPERM;
>   
> +	/* We don't support mapping special pages into a Realm */
> +	if (kvm_is_realm(kvm))
> +		return -EINVAL;
> +

		return -EPERM;

>   	size += offset_in_page(guest_ipa);
>   	guest_ipa &= PAGE_MASK;
>   
> @@ -1725,6 +1729,14 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>   	if (exec_fault && device)
>   		return -ENOEXEC;
>   
> +	/*
> +	 * Don't allow device accesses to protected memory as we don't (yet)
> +	 * support protected devices.
> +	 */
> +	if (device && kvm_is_realm(kvm) &&
> +	    kvm_gpa_from_fault(kvm, fault_ipa) == fault_ipa)
> +		return -EINVAL;
> +

s/kvm_is_realm/vcpu_is_rec

I don't understand the check very well. What I understood is mem_abort() is called
only when kvm_gpa_from_fault(kvm, fault_ipa) != fault_ipa, meaning only the page
faults in the shared address space is handled by mem_abort(). So I guess we perhaps
need something like below.

	if (vcpu_is_rec(vcpu) && device)
		return -EPERM;

kvm_handle_guest_abort
   kvm_slot_can_be_private
     private_memslot_fault	// page fault in the private space is handled here
   io_mem_abort			// MMIO emulation is handled here
   user_mem_abort                // page fault in the shared space is handled here

>   	/*
>   	 * Potentially reduce shadow S2 permissions to match the guest's own
>   	 * S2. For exec faults, we'd only reach this point if the guest

Thanks,
Gavin

