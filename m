Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B0D79C0
	for <linux-coco@lists.linux.dev>; Thu,  1 May 2025 03:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746068481; cv=none; b=YvS62KatiKGDKknCf/jIoMf33guvHFQ3g/ecJrRaJ9TkZFsh+xO0hFwpeULUDfQie/kU6Om8NYxgFMJfxu/1llFGX00o0yFSfQfNwTNv050YBJfIP3nVAt6W1dgV4DlT8Npe7OOfFxHVFUwqanCoj8CaZqCZJTj0MPmK31C3uJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746068481; c=relaxed/simple;
	bh=/ptZbSFI9sOT2FDVpzMMrJrZJtXi7a7ktLAYSxgGEAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EgnIFSXkVsKXsUfUPd6G2nFG0f7SRb2E/FREdl/FmAkQ/X+ewEnAwp30SFcYpUqixICTgZtcZcgUyqmmL7FX8F5GB/jjQWPpbfMIq27iMLfyLb0yNnlWWg+W+qGPsiHuUSSfUrvQQvIjlzyQbTXA1MKTjqscLH9CmDglg+9yDqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UwYIodk+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UwYIodk+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746068478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=66PeGHTOpdnar+Qa0JWdL51yAJjG/0kQaEukyiMWp3k=;
	b=UwYIodk+oevI+XQCHYJ+Y6zniECQFFhBiejemgIAUW0yLzcGZKAMZyuqcrYeeGJ35L2Q8g
	5dekDQi7vynLlhvS/IRSSCiXYiI5fgy8AC11iV46EIC7xErDC3Z72RzdmEqxEP00FKBth2
	UN6xgfOrye6HI4TXrYDSlgNcsn240dw=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-132-4tDBCAGrObu4zWl95edqsw-1; Wed, 30 Apr 2025 23:01:16 -0400
X-MC-Unique: 4tDBCAGrObu4zWl95edqsw-1
X-Mimecast-MFC-AGG-ID: 4tDBCAGrObu4zWl95edqsw_1746068475
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-224347aef79so7528305ad.2
        for <linux-coco@lists.linux.dev>; Wed, 30 Apr 2025 20:01:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746068475; x=1746673275;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=66PeGHTOpdnar+Qa0JWdL51yAJjG/0kQaEukyiMWp3k=;
        b=e0qQx77Ol+mndw5uSsxMe0020DjE7HHuH3S5h24rVvPHFprnW2IXs6Qu42thEZM5bD
         bwCdMjERb0awScm4XaZdBhTQO5ZDlsiD17oy3mnv7LNvHPM6LCv+VbtftClC6kDB5fd2
         BYHBWyNKx25etXXlQf+5xiNt36e+3K3jjiDyiJgyV8MpbWwemFhTpAXP1BvNlOdhXxf7
         Cqtrrrr1hcIuUHNw+vqiDeml0ikw0rJvqfhdnw/rHvXV7+HmFhAcNhPYCjK+JVPIg9dh
         xRboshep8RXB9M0vDzzvcpLCjckld7XtVzbaio/XeC6j/9CEKRJw5Nnu4QbxWF7ILqva
         1E2w==
X-Forwarded-Encrypted: i=1; AJvYcCXkuzych74HbmbaTR9uU00RWiOgYtADm+eLj06Hkq9wjPwJT/4YTQWUr0VlUzzVHETQgt1JU30QQ+Iv@lists.linux.dev
X-Gm-Message-State: AOJu0Ywj80ZXk0LIZnEQuF/OjmqFCq2h56zPZ13+LW8sOBp8xc4hN4p3
	pueY2ZbSXG1uxyGuCFcQbZHQ7uFeM/vp0ogEVsu/z76e2AnAgpjn5tSd2ttIY8oa5vWn849Vf6m
	f51mTCwWHpoZeXZBbCGhBnzSEf+KirXIJACcrqGT3F3305qr29poo31Hle9k=
X-Gm-Gg: ASbGncvc61EwV5kfaG+okBPJ/8vdasf4NBggcIv0kFmus9eiYWw9uOUyOqThJbOgxT2
	24+EK5CQcaoTtOFtFj2aCYhuyShz2ODFOUAZhwBtmys6a6o3kLoqkt+/24JZ+0y+e7EMVQFFtp1
	iidMTHHcarPMCA2+ce5F+1QIMOUdZlTZJy+eRaEG4ol3sp58Yy5E+zGJMbZlXtecDb7TQ9CKHyZ
	49BOF4NH9YuqCc4OHSnrTzSBSR4PCl2mRR7NQakPAVhBXximuM5G1QLYFL9JRWS7VhKSfiAH/xc
	UB1ugasYvC0v
X-Received: by 2002:a17:903:3c4c:b0:224:256e:5e3f with SMTP id d9443c01a7336-22e040c6e79mr22293075ad.25.1746068475348;
        Wed, 30 Apr 2025 20:01:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZAaGsqWilNG9nKIQwO6WjMhMxoDtCPFtqO+KYQXEgWxu5s0tu5Q6Ot3OxM8Xca9EYb2dyqQ==
X-Received: by 2002:a17:903:3c4c:b0:224:256e:5e3f with SMTP id d9443c01a7336-22e040c6e79mr22292615ad.25.1746068475064;
        Wed, 30 Apr 2025 20:01:15 -0700 (PDT)
Received: from [192.168.68.51] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e0a243e82sm766515ad.2.2025.04.30.20.01.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 20:01:14 -0700 (PDT)
Message-ID: <fd1936c7-cc82-4dd9-9bc0-2b25a3bbbb91@redhat.com>
Date: Thu, 1 May 2025 13:01:06 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 33/43] arm64: RME: Hide KVM_CAP_READONLY_MEM for realm
 guests
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
 <20250416134208.383984-34-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250416134208.383984-34-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: itD3rsqm9OYiod7kkb1G1sV-1ik6bZAG9j1pzWWFLaE_1746068475
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/16/25 11:41 PM, Steven Price wrote:
> For protected memory read only isn't supported by the RMM. While it may
> be possible to support read only for unprotected memory, this isn't
> supported at the present time.
> 
> Note that this does mean that ROM (or flash) data cannot be emulated
> correctly by the VMM as the stage 2 mappings are either always
> read/write or are trapped as MMIO (so don't support operations where the
> syndrome information doesn't allow emulation, e.g. load/store pair).
> 
> This restriction can be lifted in the future by allowing the stage 2
> mappings to be made read only.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v7:
>   * Updated commit message to spell out the impact on ROM/flash
>     emulation.
> ---
>   arch/arm64/kvm/arm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

