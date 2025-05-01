Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DA222FE11
	for <linux-coco@lists.linux.dev>; Thu,  1 May 2025 02:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746068260; cv=none; b=utO6ntMOT8l/Y8NVt5F75KRVEMwuZqH6KTdivPXyOxomFfqOLMIhLykXUnDO8sALRHIeIuoPDWzgUiQWNyiuRU+v+AD5p9TKBBmkHJf/ppsDVDDZLNL7DQ8ZSmhz0tHhr6jo8doQnmkKCbh5xgDoK6y3Onjwu3YTRa0bOg0kiHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746068260; c=relaxed/simple;
	bh=pxth/1xDNWc+yIhoqkRG3JLP0W+Nj7wVL5JFRfk8L2w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GpU3Xw27mXMG18EumUrZUTOiXqRdtNlvXfyb0PafDvS/HHmUkKW/K0tsPb9I32kGOG3fX6S3+zw5dbim8J5Ja+U8Oj11ZZfNJJf8fzGsjLWwGKIv34TDlyCszCbSYPX+3r0mmjlCWG63gvEENSaONN6mBIyI48D1/MtXgselB9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NUxlaUtC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NUxlaUtC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746068258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=adT5sphxyEt5TU22Dqx/wn9ELnNmdh1UTMCrVtoQyks=;
	b=NUxlaUtCTsmWQV84TgYQbk2sNhM11Gj09ngtL19bQg3ZHo1s8fbTlaU0qJk5AiNANH+84+
	lZOI8A781AtuhQWlmL1XzBSndZu2MHVla7Gu7ic98Ip1g1yM6n5D33E2n30M8p10eP+Bkx
	HNwGu+PN3iI3ncJFigkkOUGxhz8jdR4=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-bMsLZ1CmPda_8Xw5l34w_w-1; Wed, 30 Apr 2025 22:57:34 -0400
X-MC-Unique: bMsLZ1CmPda_8Xw5l34w_w-1
X-Mimecast-MFC-AGG-ID: bMsLZ1CmPda_8Xw5l34w_w_1746068253
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-afd3f1adff7so1193407a12.1
        for <linux-coco@lists.linux.dev>; Wed, 30 Apr 2025 19:57:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746068253; x=1746673053;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=adT5sphxyEt5TU22Dqx/wn9ELnNmdh1UTMCrVtoQyks=;
        b=Vy4eYa/lt8JVdhp06HVil7urIS0l485TzDbjM/OhVB4gN8kfQFHSNsJMEokZF+G9Ke
         lJ4s6Y1396hk3Mf3qeXfNYFgE8648ZLzBVCIxGij/HGYTw/AgWuIXdPENNYkuThegbCS
         oUIOQyi1MiPFbzaV9b71kSSbAIRfYkN0ZDh+1Nd6j7Hr1ywJ8S/LTSpNsOth5gy7nMXY
         X9rC5Pxb/X3Ikj0nE8DKTti70KsXNs+ISuCvMvij28Dz4SXf54Khv+30LIfiQWiorr8w
         oPX1sCuwr6nXSQ4Iq680wfpUMLttWru1B+9Xkz63tqGIHnySVOr7qSn5vERLv3SzTN4Q
         TU6A==
X-Forwarded-Encrypted: i=1; AJvYcCWfFSDkQB33BQdzRGeuhmygOLnGKaDd/XzQt03t0kd+dbhQJemxxAqMAs+K0th/ZXd2VUPYTqjm+oCP@lists.linux.dev
X-Gm-Message-State: AOJu0YzFVBs3g8VNDH0NgvfFMQBA7V3ZQE5O4xAB/xlx6QDQDuDzoLsB
	HIepRMkaU3rqQz/8OB82tk1RuvnkZlkmNljt4jUQjMdYxpinepB/Dbagt9cKMcVdFZk8gKHjFpf
	vGx+FsAiAULFhWmK3MuHvbrAwceS2uPW0TKNW2wqHJ96RufOAQ/Ln+h/66pI=
X-Gm-Gg: ASbGncuVkP+wzyp42/F9ymXlyjMahhhr26dXl92M4grEArJQeJZG3Tg7kWAQCUErczq
	d4oyGxb55rTchSwqsyF42G3njI59GgTjXxaJDVCK5L/3WHJP3xbCef6onzQHFuZ8skbpk6S8YZX
	FsrgLczYgbq4HmM6VKtEs+SZywKZsj6uqvbJIyeNgbXNfkhx6xbsy5IFaVrQBGM0r5MM49XEU2s
	akDsMpiIKyeQ4NMQs57sskAocmX6kwtFXcp+O1uzkZqUiUhU2YSASEDWveQvVlt1+VoLFaFr0b0
	GSu07oKm30OC
X-Received: by 2002:a05:6a21:9982:b0:1fe:8f7c:c8e with SMTP id adf61e73a8af0-20bdcd9a950mr1117791637.15.1746068253310;
        Wed, 30 Apr 2025 19:57:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbH4/Gw3xjrMySuSbtOSRK/2O61f3IZwIB6ICzlmAJxo3vX/hkeDxt9OR3pskpgqpIhEiucg==
X-Received: by 2002:a05:6a21:9982:b0:1fe:8f7c:c8e with SMTP id adf61e73a8af0-20bdcd9a950mr1117766637.15.1746068253021;
        Wed, 30 Apr 2025 19:57:33 -0700 (PDT)
Received: from [192.168.68.51] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740398f9786sm2578662b3a.15.2025.04.30.19.57.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 19:57:32 -0700 (PDT)
Message-ID: <afe9167c-8867-4e5f-8c0b-eb8d6b2813e1@redhat.com>
Date: Thu, 1 May 2025 12:57:24 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 27/43] arm64: RME: support RSI_HOST_CALL
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Joey Gouly <joey.gouly@arm.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <20250416134208.383984-1-steven.price@arm.com>
 <20250416134208.383984-28-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250416134208.383984-28-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BLWV9nCU5-7_qdc4QctP1A7eQAPhLHINJrciwJo3WjA_1746068253
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/16/25 11:41 PM, Steven Price wrote:
> From: Joey Gouly <joey.gouly@arm.com>
> 
> Forward RSI_HOST_CALLS to KVM's HVC handler.
> 
> Signed-off-by: Joey Gouly <joey.gouly@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v7:
>   * Avoid turning a negative return from kvm_smccc_call_handler() into a
>     error response to the guest. Instead propogate the error back to user
>     space.
> Changes since v4:
>   * Setting GPRS is now done by kvm_rec_enter() rather than
>     rec_exit_host_call() (see previous patch - arm64: RME: Handle realm
>     enter/exit). This fixes a bug where the registers set by user space
>     were being ignored.
> ---
>   arch/arm64/kvm/rme-exit.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

