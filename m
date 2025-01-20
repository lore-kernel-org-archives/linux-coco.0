Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71E01F03CC
	for <linux-coco@lists.linux.dev>; Mon, 20 Jan 2025 19:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737402885; cv=none; b=hDGfL281S0QVauG9UIdGkt6MFLCyBbxbbHYmi2/RNzsqaBm09KxYRIbSkPPz02iTRNDTgfY9nG9nsURhN2kIN7rUY5t4w1KtXIWqK1fv/67DigbsyO05VdU2Esf1Cgw/vzqj5jJddG4vHWNcFV7JBW7FTfJiax/AdByDn2hVO4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737402885; c=relaxed/simple;
	bh=WE1eLVSAcMrJ22tKWiER0be66/aXixqsee4/093Raf8=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Content-Type; b=jSAcc0A9zteWh8chxob1vCGsUjJfvrBoZQ9yNKoFtzmrN0iYqsPoZlYN7mXXuZ7Aw2qCuBAAm9eFgR3eNxlIUw6+P0+3Gia8otXwY6ZlfmBBqr8VzU/0QPCa4vtMIfBAckRCyfeDLgE25jr/xkRjjctHrthI5WuBnelJ5V3UQ20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IEJZ0aTY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IEJZ0aTY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737402882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=HwAph6RW24z4Ck0QprZ1UVZmmWpp/MHyMPMSij638A8=;
	b=IEJZ0aTY3fpZVWSC6YoW45/FW25jpiN2b2By+w2HMVJBKSdxK8/uj7/k5H4lwwCEq2f+Wf
	q5SiPH4UOZZoIaYAhmxHOehVrRpYA9g1Jl85UIU9pyw1np7U4JY+1bNUXYOqj6H7XHv7hc
	GHNnco4QC9P0lMuYDJF9XIsyMcLLt/I=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-397-_HIUctM8OWyjv03jxEhh7w-1; Mon, 20 Jan 2025 14:54:41 -0500
X-MC-Unique: _HIUctM8OWyjv03jxEhh7w-1
X-Mimecast-MFC-AGG-ID: _HIUctM8OWyjv03jxEhh7w
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43625ceae52so26067385e9.0
        for <linux-coco@lists.linux.dev>; Mon, 20 Jan 2025 11:54:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737402880; x=1738007680;
        h=content-transfer-encoding:organization:autocrypt:subject:to:from
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HwAph6RW24z4Ck0QprZ1UVZmmWpp/MHyMPMSij638A8=;
        b=PTJJnep5wjhxQ27nGgKALKAZPG0MsPF+/xs0DJ4TNkNeHT01gI16IOqzmWwgv8TFVD
         7c32LXaRXhPUiss+Z4WC057ih/FT21ADVlEHUnYELNoXOihgKlUOniuEohCDPJVmnfmA
         ZGJ2eiZ9OYez/injfTkEfkSYoBHfp/kbdu2RzDZQjGblBlK/NaaXqp3zmRlZiDTgXyJ2
         7W91duMeHOoyk7lLU9ZFE/xAm0N74XIegm5MIA0J6rd56LytJcJGSRR9GdWP3w8J6gjD
         S+RgXgHfg+mGwo2IjdnX1Y/3qZqcjWIl3GGH6NhRy1TOBuu4n0GrhlgMsTcyO/V16Dp5
         lQgA==
X-Gm-Message-State: AOJu0YyB3Hae5HRKzy9KLPCYYFONf+deb2ZmLMV53U5yj6ZdwzHSqNNy
	YWXZ6VFfTo+et5wTf9HAW/x8WPIdmb/Ou42kAn5jjXdMmynZ9Frdrf6EOuYytSAYqxWEhOhspze
	P5IK902or3p9uYKkL83uk2KJ33WNJ+SCiRUd7eQ9lITiwBZIufK9c9nbxdXaPla+RVaf1F8kLRl
	uXg8YO+EhuPsMnbGGy9YjoJ9rRCHDhvNX+D/nuUfDI+w==
X-Gm-Gg: ASbGncsJJBO4GUmNKErAwobVDV74z3dDKgLM6M83OXwWinYWkURd/oWoiutI1uTCHBV
	bFO7glHSNcirsb9cpg6WD0lSkroq6PcekMt039jUUBR34tz5VXZn9GLL+dNcPcx5vHCpj+wBuRO
	AeRcBFcjM2V5OmYQofsApBUZ4cTe1j/iEc4mJqvigjuN6mi7IJHfeGII9G4x1S5JcjWaPpvyg7+
	awUmJDqpUr2N167i0tXY8q5Bj+f5NmkIA9u+E+eBjEpabAQn1sCG/6Lnkkq57bmB6DnAiTb50QZ
	C/1cEf2CNJZ+T+0BxiiXetDdmJzSk6uuNJdwoDWbUTfdSRlmzfkKkFOloee8polu9unNmeqqqbq
	P+4zLGC4kvQYFjp+YrmTyuQ==
X-Received: by 2002:a05:6000:10cd:b0:385:e429:e591 with SMTP id ffacd0b85a97d-38bf566e433mr10847111f8f.23.1737402879986;
        Mon, 20 Jan 2025 11:54:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEZJG13mxi8AbIDkwOnTufhR9i+f5NVshcYfRBbLNh6upODgRLo5O4hvSp40QWYCP94tR4NwQ==
X-Received: by 2002:a05:6000:10cd:b0:385:e429:e591 with SMTP id ffacd0b85a97d-38bf566e433mr10847067f8f.23.1737402879308;
        Mon, 20 Jan 2025 11:54:39 -0800 (PST)
Received: from ?IPV6:2003:cb:c72e:e400:431d:9c08:5611:693c? (p200300cbc72ee400431d9c085611693c.dip0.t-ipconnect.de. [2003:cb:c72e:e400:431d:9c08:5611:693c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf327e1fdsm11490020f8f.94.2025.01.20.11.54.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jan 2025 11:54:38 -0800 (PST)
Message-ID: <019cd0b3-52ea-44b5-95ae-9b8b14477b8e@redhat.com>
Date: Mon, 20 Jan 2025 20:54:36 +0100
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: David Hildenbrand <david@redhat.com>
To: linux-coco@lists.linux.dev, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 KVM <kvm@vger.kernel.org>
Subject: [Invitation] bi-weekly guest_memfd upstream call on 2025-01-23
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: b4VY0t9wG2sDjmT-qFFQJx0i387sFwW_4dxjfz5A7dw_1737402880
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi everybody,

our next guest_memfd upstream call is scheduled for Thursday,
2025-01-23 at 8:00 - 9:00am (GMT-08:00) Pacific Time - Vancouver.

We'll be using the following Google meet:
http://meet.google.com/wxp-wtju-jzw

The meeting notes can be found at [1], where we also link recordings and
collect current guest_memfd upstream proposals. If you want an google
calendar invitation that also covers all future meetings, just write me
a mail.


If nothing else pops up, in this meeting we'll likely continue our 
discussion on:
  * State of huge page support
  * State of shared device assignment support
  * State of shared vs. private / mmap support

To put something to discuss onto the agenda, reply to this mail or add
them to the "Topics/questions for next meeting(s)" section in the
meeting notes as a comment.

[1]
https://docs.google.com/document/d/1M6766BzdY1Lhk7LiR5IqVR8B8mG3cr-cxTxOrAosPOk/edit?usp=sharing

-- 
Cheers,

David / dhildenb

