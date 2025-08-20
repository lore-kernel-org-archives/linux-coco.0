Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B393093BF
	for <linux-coco@lists.linux.dev>; Wed, 20 Aug 2025 14:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755701424; cv=none; b=HHMv3y4Ievdf87UkR567fTAGycctaicEaldDs0lhqG9qYiGM9l8mqPUtmybGPLoVL1B9UZcXlLQc1LuIA3dIN1Wz22ZWato8Nlxe0ZRvOv7a7rC+AUrEDoTxSou6azlIoinVOljv56V1sgbb34iNFbM/gysiYMPOuaC/Fs+rA/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755701424; c=relaxed/simple;
	bh=tvnQ4mm+tXZeMk9LeMz2m7m/7OzfKG5aXmHoWDxySPM=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Content-Type; b=PP2gyXoEPJUnuzEJbqg73Ds8YneQFNWJiXtclxtrm1WmdPN9WDTvhO4ebbkmuxdgcQKdCQ57tzDlRpiExidhdJ6lTG/V688fLX9EifootnD3I7ZkJi4voScyfrfaqerU9KY0UcTQ3lWMX/HQ0ZudE9icFFnVYP8c7TNXCcoR7J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PE2/Jv/A; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PE2/Jv/A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755701420;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=UVDesp2YzkDiQhPhj3wNDxcGmY+ZKVXe2qM+mIpLJuQ=;
	b=PE2/Jv/A990F9/HJnGkvi6wVEcdDkmP3bf80+SP/myhaab/yoXqCqSC1UYia1Ou6YIXRnG
	PNPbBx/v4wi6jMKnrrroPgSMYqoiUHaP7m1X5cS0TYpyvlP1vUAmpaI9ZC4ti6Bjem6fiS
	VsQoXrHGyodRu/7W8GuLMQSaS7SuSis=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-441-9KkGRe0uOmG7tLBsG9xtkw-1; Wed, 20 Aug 2025 10:50:18 -0400
X-MC-Unique: 9KkGRe0uOmG7tLBsG9xtkw-1
X-Mimecast-MFC-AGG-ID: 9KkGRe0uOmG7tLBsG9xtkw_1755701417
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3b9e41037e6so4225f8f.1
        for <linux-coco@lists.linux.dev>; Wed, 20 Aug 2025 07:50:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755701417; x=1756306217;
        h=content-transfer-encoding:autocrypt:subject:to:content-language
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UVDesp2YzkDiQhPhj3wNDxcGmY+ZKVXe2qM+mIpLJuQ=;
        b=VvK7NTtyAyr47FiTixhpx7RDhsupKdYm/GiQ7jVSscg3jWHWRYCTVKy3leFUHQt9y5
         onUcQrWeECVunOAiA17WZvtEhidJ1girbg4QyEJ4eYD8ZCL9tVMcwhKBKhANN3bfQiM7
         Cnl51eoKY4Q/NjMjCQmAcOfko5VCmXUOYQjiRN4OPyQjNmUWrBEh1kzK4XDzQOc9UPzl
         yXFJIskMKO5ql/I9FvlPsykJ/2JFYR/FG9R/EyjtVdrcdcdPqibRNPfKQ2pmPF66rIvp
         UHQexoeDePy4fh8uGESTTvQbqSBKB+L/5TNh2+NCX51se4XcUrQ88z4U+se1/QqdB2/n
         isyg==
X-Gm-Message-State: AOJu0YzVICnj2n0Tyf15XPrboGX8+T18h0lJSDtGk4h7HIUaM7qYT+xG
	pzSD0oHP0odb8oYIxVxP92fAf3uNx4u3yxOpl6HW8TWefY+XWbpA6QgTPWk31zMoVexPGULN3Yv
	j4Q2Ko7TbKlw+R6rLOV6bzljPNejGTCxxeiexUGPf1M4u/QuDeCuCHjTSrNwSfOeJqkB4eoc8RA
	lx3MIYuJv2LbDoxVDa4rtNhQkC4quVYXMumR6U/vN/OfcfZw==
X-Gm-Gg: ASbGncslWv/stmbM8WvM6VUANkh+wr7qeadq9iNasd2R+/H1JlI44aD/JprAX57EGcE
	YQmv+V3Ur2IqOsRDGHctn/36VKMHSQVUU/nMCrcQ4y2TLyh7qsIPEeM4IN2qRCp+POnYIJXNHx1
	9rNQ2N2puHAwUgiXU2PluA1PELjVhBnxKeUVqOUlnayvTm4xkwUBlnl+E2OPc8fxY/FISsMxIq1
	iUYRXB6t8dlpM5avjg5aDh7eCr5bVkEAZtv3TzaZsYHThPRhtvZGoHx9zC3LIyw0aze/j2y6ViM
	DRX0k0IsptvVAtlbyvNRsUEkYCKu/e6FrLKRZfqRivfdA7/HcRKP3HmbUwXK7Sxu3E+wM4BERT+
	J8oM9m8f06em6ycnRDHbsaFjYlvH+H1EBNFgkZMdSgdnvNEzxYxCa8oFum+mQviVP
X-Received: by 2002:a05:6000:2282:b0:3b5:dafc:1525 with SMTP id ffacd0b85a97d-3c32f664611mr2236159f8f.33.1755701417018;
        Wed, 20 Aug 2025 07:50:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMpI9AfBVahnq7+dVkf+h2VoKoGyjqGXGgZgTRtEbKx9O3Qm4CSoB+Kss7RoTy7Q+a4bVu1g==
X-Received: by 2002:a05:6000:2282:b0:3b5:dafc:1525 with SMTP id ffacd0b85a97d-3c32f664611mr2236098f8f.33.1755701416229;
        Wed, 20 Aug 2025 07:50:16 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f13:de00:e9f1:62b4:5bb:5d83? (p200300d82f13de00e9f162b405bb5d83.dip0.t-ipconnect.de. [2003:d8:2f13:de00:e9f1:62b4:5bb:5d83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c07487978bsm7822833f8f.7.2025.08.20.07.50.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Aug 2025 07:50:15 -0700 (PDT)
Message-ID: <2255e387-857c-4b5c-b27b-f7f2a6bcaccd@redhat.com>
Date: Wed, 20 Aug 2025 16:50:14 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: David Hildenbrand <david@redhat.com>
To: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, KVM <kvm@vger.kernel.org>
Subject: [Invitation] bi-weekly guest_memfd upstream call on 2025-08-21
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CtqrLxGjUD8e7Igi9nC-dPgwmTqfiPp7o0Ajz7eV8ho_1755701417
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi everybody,

Our next guest_memfd upstream call is scheduled for tomorrow, Thursday,
2025-08-21 at 8:00 - 9:00am (GMT-07:00) Pacific Time - Vancouver.

We'll be using the following Google meet:
http://meet.google.com/wxp-wtju-jzw

The meeting notes can be found at [1], where we also link recordings and
collect current guest_memfd upstream proposals. If you want an google
calendar invitation that also covers all future meetings, just write me
a mail.

For now, nothing "big" on the agenda yet, so we'll see whatever pops up 
(I suspect discussions around huge page support :) ).

To put something to discuss onto the agenda, reply to this mail or add
them to the "Topics/questions for next meeting(s)" section in the
meeting notes as a comment.

[1]
https://docs.google.com/document/d/1M6766BzdY1Lhk7LiR5IqVR8B8mG3cr-cxTxOrAosPOk/edit?usp=sharing

--
Cheers,

David

