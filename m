Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70C52FC877
	for <linux-coco@lists.linux.dev>; Wed,  1 Oct 2025 13:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759326789; cv=none; b=Mo9QAFJUcwSsHtbDB6N3LbOcc5kCpqX7R4tRY0Ammva1kaAEXcGTpYCivTFP5yMBO4+7wK4c1ddMkXKCCOsNCdnlTNj4h013tfCHXDoBN2we19XDlH5EMYPv9m4ACDFi3OH7Vyd0lkhC1zSNXKdcM62tYV3zxZ3d40GD4RYicwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759326789; c=relaxed/simple;
	bh=RIqSN5lOS0lx+fxCdvmQnUTqlJNkX5KmnQOAVM36xgU=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Content-Type; b=F54KJ4D+GC4OiQW6hCMvrkmY9n7qFZg6ZYkJpP+07fza+ReoIUb+CRR0+683Y8KxJpT97XgSEmVSbacvK6RlMkH2W7hLuCUlK2s05h0gCy9ZHzSO71XWeDgel/k/s1t6nmY6EAR6+2cnhLZlZnT5iFvhE7YWH2lxuhjSUh26d6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gM2ZPMh4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gM2ZPMh4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759326786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=RIqSN5lOS0lx+fxCdvmQnUTqlJNkX5KmnQOAVM36xgU=;
	b=gM2ZPMh4ldm1fysXQgc7CZ8/6NC6bZ2wP0pxtR0fLhCwPRj5K+CdtnugI+BQ5RMDSoRSbM
	Y/JstauvA4hwTzK2Ik3MjE8Q6qF6Lh6CmchLBN/piu1lKdX5yTvWevmvJBHSTG/WBvrY0D
	IMgIN0k/P2ppgr9fxWDCdzGymp6/gCs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-hEdvGMAnMNiyfKH3BLfZyA-1; Wed, 01 Oct 2025 09:53:05 -0400
X-MC-Unique: hEdvGMAnMNiyfKH3BLfZyA-1
X-Mimecast-MFC-AGG-ID: hEdvGMAnMNiyfKH3BLfZyA_1759326784
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3ee10a24246so4045199f8f.3
        for <linux-coco@lists.linux.dev>; Wed, 01 Oct 2025 06:53:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759326784; x=1759931584;
        h=content-transfer-encoding:autocrypt:subject:to:content-language
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RIqSN5lOS0lx+fxCdvmQnUTqlJNkX5KmnQOAVM36xgU=;
        b=D9acZZutClG1fP6lekS9RNI7uvO1JwuNslZJfskyIb3uhs6JhwPXwPzOpDDFSfRahQ
         9WiLOJnmI/KLtW6zapMCmYh2B5l954a3IBPVJSU+Vk1sR9RdMBM0fp3VTEBPtATRXoh0
         xzevho2abf/A4yFTV4N6oxpAVRAdzbLXyWQnHlqU+ID8ROesq+3/YbGcNYc3OdQ7a7IN
         ba8GctjrG05vaauwWrNcG5CIP9H/1PiYalALmO/5S5e6r4G4ENcH/flzenmy6Wl13k3b
         zXTsUmBNVbAYDbQjeGWEG8kkWV3/UAkys39geTEEHYQzh40ADhrUFlYh+C/dpAQ1TgzN
         SLEA==
X-Gm-Message-State: AOJu0YzG21XEKZfZf4lxsgMDqpGBQ0W/stoY51jo/ISFhONbjcC6hBdd
	njOOe50un4lU9mqmYCkV2cC6/j6bUPBB/5TLE1foGpHpkPbgDmLKhB12WUQOeMTIyEZN20TOVpe
	svU6VnHq1IWOb9JYER3PVeL/Nt3hf3j5+zgPqDn/ExoYpfzmavg35qv8fQIhllJtaqT7rjJpdWe
	4oKw80KByu0qzaRYzBPBgr3X+7hgqRbLP+3891nDygRlgUlw==
X-Gm-Gg: ASbGnctsM5QQtINXs/+rHTOoucwr+7jp6PlWDBCtBwnO2PYzEtJ8FY2jvbZy4klHPNX
	r64dmPXZ9HhwVINnizQMLFBdmjdxm1IMc0maMFvGJ0XPh+YjIVCMtpRVmTFNechndz0u1kP6NTm
	ZzcA229lnVYgjlrNP2KoAVQXNWxf5/HsHXSWMma9TMi6UOd1BBcOkKpgiRPGGuojhQyLZlwLqbI
	ninS8+vn2bXjjkvk02+bEBYn/h4LcViZNbvu3mMYAbXoaHJ/hDNB6jIDWtI9A2Q1543qUZxzITl
	daQ8B+J803AuZrNBA4yckUgEX3h48cs4l/iHtdLR8ySKsp1kIWOWQlVW/KxzCD1gOclGcEze0V6
	oaCL70nRC
X-Received: by 2002:a05:6000:178c:b0:3fe:4fa2:8cdc with SMTP id ffacd0b85a97d-42557821af0mr2950615f8f.60.1759326783902;
        Wed, 01 Oct 2025 06:53:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+osrXX7dLfhabimwbe1Ui3dLBz9xJHd5NVGLhrkEfVO7icb3iXnJtmb1AUet8mnR6yDeTcw==
X-Received: by 2002:a05:6000:178c:b0:3fe:4fa2:8cdc with SMTP id ffacd0b85a97d-42557821af0mr2950550f8f.60.1759326783222;
        Wed, 01 Oct 2025 06:53:03 -0700 (PDT)
Received: from [192.168.3.141] (tmo-080-144.customers.d1-online.com. [80.187.80.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e619b7e37sm40453365e9.1.2025.10.01.06.53.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 06:53:02 -0700 (PDT)
Message-ID: <ee522bc0-8c99-4065-85b6-c1630cb72a85@redhat.com>
Date: Wed, 1 Oct 2025 15:52:58 +0200
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
Subject: [Invitation] bi-weekly guest_memfd upstream call on 2025-10-02
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jp8kiDC10MLH5XuT_bCXoz4e51-Pcy3rvRKw1XZHOfk_1759326784
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi everybody,

Our next guest_memfd upstream call is scheduled for tomorrow, Thursday,
2025-10-02 at 8:00 - 9:00am (GMT-07:00) Pacific Time - Vancouver.

We'll be using the following Google meet:
http://meet.google.com/wxp-wtju-jzw

The meeting notes can be found at [1], where we also link recordings and
collect current guest_memfd upstream proposals. If you want an google
calendar invitation that also covers all future meetings, just write me
a mail.

In this meeting, I suspect that we will talk about

(1) direct-map-removal support

(2) mmap() support refinements

(3) "stage 2" and whatever comes after that

To put something to discuss onto the agenda, reply to this mail or add
them to the "Topics/questions for next meeting(s)" section in the
meeting notes as a comment.

[1]
https://docs.google.com/document/d/1M6766BzdY1Lhk7LiR5IqVR8B8mG3cr-cxTxOrAosPOk/edit?usp=sharing

--
Cheers,

David

