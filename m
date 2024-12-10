Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67FD78F4E
	for <linux-coco@lists.linux.dev>; Tue, 10 Dec 2024 14:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733840753; cv=none; b=kpjFJGnOckjnVuXnASM4L3D2ScNAb54MBR5SA36HnCMhFHKkRPtPbihM2++4TaY/wiU9CnQtgHkm4kxbI1+NyUVye/BWJNwTAASdKv2uD4f/ski9jDotbE1ktNeHG3XnvCdqzpdZ+9NPNHah4ieHLBcUrayEm68X7ywFmaPtvRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733840753; c=relaxed/simple;
	bh=cA/3qf3TyjBBma0TFTcUMuYhCklusWionPkbjPCSWYE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=UpzFE6g7Lp6FbImY65LFpCph9OC5z7W/Cu4H5TmM6/lVU8cZO9P5emKSvlUYkUra3I4roeq9dchyyfNqOrncpp8Qr5Kb1jiazMTB41m/SCRHa3LI/uBXxqO+9uZlJR6sk2Sp7lynk7950G9p0Im4ee+wKMx9dfAxgbnHxdmY4kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YuGmXN8d; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YuGmXN8d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733840750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=nMN0y3ux3WvppLtC/Lahl70r/ZzkIQ5OKqJG9wbZMi4=;
	b=YuGmXN8dJ3rV+5xXpjBKGBYrBWDgDD5NhdG17qWkj46x8PA3fpxCN4HqT/BzgjqRpTf8aD
	rPKTqbpdr+OahK+5FrFIwzuRS0Rj2EH7jKXEMGhuFNPyIv3LV2Va97ZAFAu2UMfQaA4Hl6
	AbiHxGEyNMMGBnHdOf9Tgo44MMX3aig=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-220-CXLlCmQxPzejT_HL7ApFeQ-1; Tue, 10 Dec 2024 09:25:48 -0500
X-MC-Unique: CXLlCmQxPzejT_HL7ApFeQ-1
X-Mimecast-MFC-AGG-ID: CXLlCmQxPzejT_HL7ApFeQ
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-434f387f346so18973745e9.1
        for <linux-coco@lists.linux.dev>; Tue, 10 Dec 2024 06:25:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733840747; x=1734445547;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:from:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nMN0y3ux3WvppLtC/Lahl70r/ZzkIQ5OKqJG9wbZMi4=;
        b=DAfXKBWXAPlABSt/ddiIL4NyFWGpk9i4mYnAAeDQRVaYRgJ0WN2SGq4viHy07X7stB
         GEAdNXXRPRYpGC+LFr/uTwy0L+DWk+yy57Rk/vl5BMwBG2wUev6Miyv/FKUrHpIldfEn
         9xnde4HA8j21mYMxX0VIh51YRrO32H+2Jek+y+cQWjs1kMmpx1sqSxOYPpY87+ZUkV49
         Kz78G9f6Aj1s5juzWYPCNcvQERBd4zKTcnx1EErxpDPOGe7PZhmcnXwnt0KCTfdp0b8L
         73QBXYnzmIaJZ0rzYsMhqATRe0CloCO72VEJ4kTrTjTYy/KBkYkU0LM6gvT3ukE05EBy
         8qKg==
X-Gm-Message-State: AOJu0YzMH/D4DlrIhUaMOv6uhvS1LF0XeVZ+V3SAxkpE5t7b/e0mTGHl
	MPG9zvO95dJZEAvcPgBUp2gAfw4ccgJ1R0E6ZVFlpwTfanpGfESVEr/STWOqocGN0f0JP5/keNS
	ypCOQ8izfQpkY54J6+OePaKHhnclXMZoZOcrerRH4CorcsGJQrsiUyLMy3ZGayytxX5Z9dbXDw4
	jnxXAXGHtRMWI8W2wQy1jmSs3e/rbgp3Pb4d/+hj1OQUJf
X-Gm-Gg: ASbGncu3eJgydrY7wCUjTOmrXvNT46CsvUcR7N1ZNIMj1X3PAK25BLUei0QjndkScDz
	btpmztcgp95KymNj/8tX3p9vFPIXGwKd2+J8fy5NXJJ9SDwMbq9+yit8BucnzS5RJcvkN0DaqjS
	taRib6nMV3DuG9hvtWvZ9wg7lfUpn0Y/TVAWel4D6s9Tg/97OriezwgOhGmSiIaoHHHRlVHtJ2Q
	o08JZH4r0MnarPqP7ad/JV2+tY20aNpaRuidXNESkTjVDHNBJR6aG9ZolrUQXsXmdEHKEgSZzoW
	gwFdA4h9jFU5lbvziyoNh0n5fTkMWq6o4ewYXdfW2OxA1k/UMTm1fpea1/rlsRsKF9F+em2sk62
	T2BkSvg==
X-Received: by 2002:a05:600c:218b:b0:434:e8cf:6390 with SMTP id 5b1f17b1804b1-434e8cf6549mr94988415e9.6.1733840746703;
        Tue, 10 Dec 2024 06:25:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJnkFB66zE9xnnE7QhauM2Jhax1zGEw26TJ6JIM1odXaiVw9iraI+BaGUn8AOejS9PBofB+Q==
X-Received: by 2002:a05:600c:218b:b0:434:e8cf:6390 with SMTP id 5b1f17b1804b1-434e8cf6549mr94987895e9.6.1733840746008;
        Tue, 10 Dec 2024 06:25:46 -0800 (PST)
Received: from ?IPV6:2003:cb:c723:b800:9a60:4b46:49f9:87f3? (p200300cbc723b8009a604b4649f987f3.dip0.t-ipconnect.de. [2003:cb:c723:b800:9a60:4b46:49f9:87f3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d526b577sm233326495e9.3.2024.12.10.06.25.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 06:25:45 -0800 (PST)
Message-ID: <b9567cbf-8ad7-440a-8768-f4e7dbd2b5f7@redhat.com>
Date: Tue, 10 Dec 2024 15:25:43 +0100
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [Invitation] bi-weekly guest_memfd upstream call on 2024-12-12
From: David Hildenbrand <david@redhat.com>
To: linux-coco@lists.linux.dev, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 KVM <kvm@vger.kernel.org>
References: <6f2bfac2-d9e7-4e4a-9298-7accded16b4f@redhat.com>
 <3a544ba8-85cd-4b91-940f-85f6f07f2085@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <3a544ba8-85cd-4b91-940f-85f6f07f2085@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xPrbPyJnpcNm2ILfsXT36Hs1wJkxe8PxOKifAr-FpYM_1733840747
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi everybody,

as announced, we'll already have our next guest_memfd upstream call -- 
likely the last one for this year -- this Thursday, 2024-12-12 at 8:00 - 
9:00am (GMT-08:00) Pacific Time - Vancouver.

We'll be using the following Google meet:
http://meet.google.com/wxp-wtju-jzw

The meeting notes can be found at [1], where we also link recordings and
collect current guest_memfd upstream proposals. If you want an google
calendar invitation that also covers all future meetings, just write me
a mail.

The agenda of the last meetings were pretty packed, I have the feeling 
that this one could end up a bit "lighter".

In this meeting we'll likely discuss:
  * Patrick: KVM gmem MMIO access challenges and KVM_X86_SW_PROTECTED_VM
    for arm
  * Aneesh: Feasibility of 4 KiB guests on 64 KiB host
  * Persisting guest_memfd across reboot / guest_memfs (if James is around)

And we'll continue our discussion on:
  * Challenges with supporting huge pages
  * Challenges with shared vs. private conversion
  * guest_memfd as a "library"

To put something to discuss onto the agenda, reply to this mail or add
them to the "Topics/questions for next meeting(s)" section in the
meeting notes as a comment.

[1] 
https://docs.google.com/document/d/1M6766BzdY1Lhk7LiR5IqVR8B8mG3cr-cxTxOrAosPOk/edit?usp=sharing

-- 
Cheers,

David / dhildenb

