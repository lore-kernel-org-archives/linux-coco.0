Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66C52F0670
	for <linux-coco@lists.linux.dev>; Thu, 23 Oct 2025 17:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761239407; cv=none; b=WqEUflG7UFz4xmuNGgth9Ggfpy3nySomvfZuHfRsY4E2LbUyEe6CqJ7Gp0/qd/bzgne1Yt15ZWFtKLxKlNYOgLT1oAFBzM3nfzxQMJ+diDcw9EBHB/7HGKPuVL2hJyXDin4SByUSnizN4OslpZPZtXyycABaVC0Sm85v8UeMdXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761239407; c=relaxed/simple;
	bh=+Tzm05G8OP9Ub45Ed00gm//RkZgsf1afggpDogpUKf8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BvCvQKqH297QDCMlKRNCd5HLn2BpFwXDqJx8d7N3ClW9WzBnawnnRBzGmM/hkyUGpwUoy0pWxaCsaZsvh+jd2cYxWAO2N9rJ/XDtRSegPWr/ukzT7V8oMAnh45x0vzuXN28B4bnLUy4EjKX93zUCc2HpGfkxiYr9TFLbDoHZMBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WiN8gAnJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WiN8gAnJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761239404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=sIho/DDzaUGECoEpXxSYe8QzakIm7oukB+I/Bz1nx2A=;
	b=WiN8gAnJGCLR1ta+lx2vOJQiqtO5cNcTfpULkzmoatoBO/a1l5HZMaH0N+DX0mG1KtZI42
	kRLqjhGmEyM1o091eQ5FpMcwTuC1b+F2KagYZWRbuErGZ8/aWlxSof8BLSWaRTJq/MU81o
	n/Go5bf2AN64ibl5lRVyqZqaASrhgaQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-211-_-gYPoceMsuizIWj0VTBAw-1; Thu, 23 Oct 2025 13:10:03 -0400
X-MC-Unique: _-gYPoceMsuizIWj0VTBAw-1
X-Mimecast-MFC-AGG-ID: _-gYPoceMsuizIWj0VTBAw_1761239402
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-42700160169so864840f8f.1
        for <linux-coco@lists.linux.dev>; Thu, 23 Oct 2025 10:10:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761239402; x=1761844202;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sIho/DDzaUGECoEpXxSYe8QzakIm7oukB+I/Bz1nx2A=;
        b=PQLVa7D3bATD6AOamgNxV64sXJRHCxUABfk+p/8v3xoomApjI3R+IVblOTzofA9sWm
         Rt+ddlQ3PC2evKA92fjm7QEk4KQKXfqqGO98ARJmlsfYqb7cbs66/b4x449pyxVDvf3n
         yOLCIGBN9opQ5cHKPqrBW25zTPV+3CRgA2bOMRqKZbdxPVzakphHRRcZpC1tEngiNiOc
         Z6YiTCyxFKf4XedgtbWJ+Yess31gToQrc53m8ZWiKRvxstv+4dtLJ7398wAnGYg+xjnB
         m30r+aIkHS7EHcYLnyuwTVfIhf59gHyOdcjVkVDtmFHHjRMfCJoGx5r8ll6NlhEZjpVG
         0y3g==
X-Forwarded-Encrypted: i=1; AJvYcCWgkrHoCm2NwOAxzeiplVkLIJXejGUPyXOLsFKozXVJ6/6j+0sX4M9ITvbW4iINH1rXIhgRHzxhsTr+@lists.linux.dev
X-Gm-Message-State: AOJu0Yye4MciDvbreinhhTDAY6dC2XVAEmU0E1kJ5E+PGsDdHtm5RwRn
	hHRXEcB5cI5d6K4UNEgDZz9ReaqVZ7H/ENrVXAm8fdnNPpjD/jpyfTZD6giWly2JR7dtsaVfBnj
	dAutIP6Tto5nex7Iedtf8DmfhHr15nNg8G1xwx6/CokVbCW6uQrJNXzTV6Otc0yQ=
X-Gm-Gg: ASbGncvOqN65wA6CGLgHLwGDLgv2mJDonzpFXchzcbgayvSbeDpBpGrlD4nHu07zEAQ
	LR2kFnxOLIuEgBS5GoYaUnuf+M3eZavA2uRpdPjuuJGP4audEQPDZNfsoT4SP6AGHHDOjzqvsXl
	G/P7dGVdpYrOZYF73wIF5nlR1/NryzLLh0NR1uSpuS8A1GXLYngM3IzJS4IYYuoYLiovKBOzM0D
	zHwhbLEE16heqDJtQnwq717Vd/jDCGdDeR8z29+owxsUh9au04vicCP70omnk11OxxZwQxAWvG+
	ceanP67fiflh74+1ZWtzC2OUUIONJ7BNP3cUEkYOCpU7nOnC9qMzuVFGQhWVYVTEJ644xvhwpe1
	NgUKAYLws2BpfGBw8++O/4RdIL1iaW1lFb99ev2VLcpS2pYFRRWZfLKJbVrMWmGR5npsxGnJEfj
	ZOWg==
X-Received: by 2002:a05:6000:2dc3:b0:426:d54d:224d with SMTP id ffacd0b85a97d-42704d7ebbamr21063043f8f.27.1761239401984;
        Thu, 23 Oct 2025 10:10:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeBhshgveus83Fujm4tgQ2AjCJ8NaeUFWeh9Yb6sABVsAFvyZkwYO71LXFd/b8AbLwDNMtzw==
X-Received: by 2002:a05:6000:2dc3:b0:426:d54d:224d with SMTP id ffacd0b85a97d-42704d7ebbamr21063025f8f.27.1761239401614;
        Thu, 23 Oct 2025 10:10:01 -0700 (PDT)
Received: from [192.168.10.48] ([151.61.22.175])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-429897e763csm4959502f8f.6.2025.10.23.10.10.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 10:10:01 -0700 (PDT)
Message-ID: <8901c04b-6fb8-4964-a8dc-5a871d026a70@redhat.com>
Date: Thu, 23 Oct 2025 19:09:58 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: KVM Planes with SVSM on Linux v6.17
To: Christoph Hellwig <hch@infradead.org>, =?UTF-8?B?SsO2cmcgUsO2ZGVs?=
 <joro@8bytes.org>
Cc: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev,
 kvm@vger.kernel.org, qemu-devel@nongnu.org,
 Sean Christopherson <seanjc@google.com>, Thomas.Lendacky@amd.com,
 huibo.wang@amd.com, pankaj.gupta@amd.com
References: <wmymrx6xyc55p6dpa7yhfbxgcslqgucdjmyr7ep3mfesx4ssgq@qz5kskcrnnsg>
 <aPpE8emZ9n4N7S-T@infradead.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <aPpE8emZ9n4N7S-T@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: whxcck1paN3ggshHef0febbJBHnXj-3Q7nkGIRPbtQw_1761239402
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/23/25 17:08, Christoph Hellwig wrote:
> On Wed, Oct 22, 2025 at 10:35:28AM +0200, Jörg Rödel wrote:
>> Hi all,
>>
>> This morning I pushed out my current Linux and QEMU branches which support
>> running COCONUT-SVSM on AMD SEV-SNP based on kernel v6.17 and the original KVM
>> Planes patch-set from Paolo.
> 
> Can you explain what this alphabet-soup even means?

With pleasure :)

- SEV-SNP: virtualization feature to encrypt VM memory (SEV) and also 
protect from attacks from the hypervisor (SNP), by matching the 
hypervisor's page tables against a reverse page mapping (from host 
physical to guest physical address) maintained by processor firmware in 
collaboration with the guest

- VMPL (bonus): SNP feature to create privilege levels within a single 
VM, for example to manage persistent secrets.  The firmware at VMPL0 can 
hold secrets that even the guest OS at VMPL1+ cannot access.

- KVM planes: KVM feature to  create privilege levels within a single 
VM, including VMPLs

- SVSM (Secure VM Service Module): privileged firmware running at VMPL0

- COCONUT-SVSM: one implementation of SVSM

Paolo

