Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198F128A72D
	for <linux-coco@lists.linux.dev>; Wed,  6 Aug 2025 11:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754478628; cv=none; b=n1ju954FBmfY9yjXl1dm5coiJI2/PhDs597yuAMrWdsU1eZPZmtfYkHBKOMcN33AjMw+nuv6wEzZNs+Cga4NONBQCYggVsdPs9WYY7GOrMSb6ZUWcHVe/heTVBNku+01YgOj/ppCIqjUpC8JdjnsKM9NJ3H/BDGf+bST82V4tvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754478628; c=relaxed/simple;
	bh=GxKLud4jcr8g+22R+KwttLpr71c+aSuT7ZFv+s6yU7c=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Content-Type; b=GYe3q5wNaad5wVByLVnbDxeROPqoVM+Z8h/xsmvWrLquKQILm+H+I88Dx5s9k/bZdaU5swUOd608IiQLuXrzLyXhG/NNjqSzBvFZbwEpzCdmjXLGwNGO3KzQI5Q8gVrCI2S6iLpu85l/Kq9N3GcsUQtNojg5t4uXXwQH2Ys5wm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d9auzkIH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d9auzkIH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754478625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=XAY7c1HtX60oJJVxckLBFD/t6sL+wBhfaXA+lmyJDz8=;
	b=d9auzkIHodNOZkfqs87W44T5Bj5X1EeFqunWV8kBhxBMvvkprhzWOicUGrWsKIgdGkBXow
	XCP4HnyDwyobxpF9uxPbsd5DfWJKTtD1gcRbWdwUuXL37JUM6EwKpSFQ2mOjgMbZNXQGhr
	EnF5Dt4pyHjaRnAxBP8pUp9rCfUtY9E=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-HB27NY_QNruDvdKvwN9YjA-1; Wed, 06 Aug 2025 07:10:24 -0400
X-MC-Unique: HB27NY_QNruDvdKvwN9YjA-1
X-Mimecast-MFC-AGG-ID: HB27NY_QNruDvdKvwN9YjA_1754478623
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3b78aa2a113so2807495f8f.2
        for <linux-coco@lists.linux.dev>; Wed, 06 Aug 2025 04:10:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754478622; x=1755083422;
        h=content-transfer-encoding:organization:autocrypt:subject:to
         :content-language:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XAY7c1HtX60oJJVxckLBFD/t6sL+wBhfaXA+lmyJDz8=;
        b=U5g91wHuNPbumVODyuWRZLprncK4HkYEUSJY1ZnUz7Ehc12arW/ENONY8F/7pkrw8Q
         tccr7GppUaMhA4KJt7q4Q3J2wtRRDCFWf+tGIeNc87wrMCcO/Lj/EM4+qCpNPOtVuz4E
         N9W8phTT7RHHOQN4IrsiQpGGxSJoVan1WrmDhLhcXzPynWbWG1vMVuveAG8Uvh1W4+54
         fcxw33RBR4Rj3gWXZiHRhFD+SV1KgfBb3SpiRmEt0wO/KeRt2KT15dcrAtJ41CeuWAiN
         UkhV3zMMfgh7xOCzQ4A0EGBtS4bQroGMpI9nU8oGNg4UBDeMf1Wy3/VIZcWfy1wDAbpo
         1lyQ==
X-Gm-Message-State: AOJu0YxgfrJ+D6jJ/0FTKK5YHWnD8LczFBXCi0dHXq+dqZVVHN+3sbbV
	dtNC03zBb1PKPwwzAomcF0DydOhajQ9eeT7Fha5qQR6tyNfuTHbmsalycmkQDgKjDXGwiG3/3sN
	WO2vN4IDrG4FboSBuLkC6OTeclp0aNpDq+vkWiGM/SiPgtsH2zqcBDsLmf7bSZtKPFJUJxfAsfg
	JAYoeHtD3NDSbf7YgPB8ORJmxeTprCLjhkJoKn0jnsc/VIOA==
X-Gm-Gg: ASbGncvICAfZMx/ubntmD0cDE49k3ogL+WZd6j32SrikerCOZytwAfrZbmgMOH8neI6
	WAcceQxAXbB9OlzlUV1paqjeBZ116baNOJK5SlDK4FZFVh04y2DbZuTDiApCFhzIN0xFeCS/oLg
	+AeiQf85Wukn2fSqlADwfZh5yNP7V9UfWyXF4Iw4cdGlUfh6UxtNvxRguqUWwlxY61FZrH7cNhC
	JehiuMiTwYmiZDRJ+1ehhFEkikvjeRbJ9CyNHV86a5asGi2c6lm8vFgpj8Q8RYeiODmeOJ96lcn
	OR6tuAh9loZ9GJiIgrnpxUIJXwGpepjTx0VIY0rulO3Pdcc4MFgmrFQW85nPug9z3c+XcjUa0kc
	ScJA0KOFkFk9kyaz/qteZNQYB83i3Iyl5ApHwefP3pP2rz7nnEDcVcah/EGrBhkMqpIM=
X-Received: by 2002:a05:6000:288d:b0:3a5:1cc5:aa6f with SMTP id ffacd0b85a97d-3b8f41ab508mr1975882f8f.34.1754478621410;
        Wed, 06 Aug 2025 04:10:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQzGmG7gVuLaEDM5KBNP9RBSztU6v4bneU6B2Iy0jHsPSiD9zV/vDYLW9EhPrxzI/pFKH+Bg==
X-Received: by 2002:a05:6000:288d:b0:3a5:1cc5:aa6f with SMTP id ffacd0b85a97d-3b8f41ab508mr1975811f8f.34.1754478620676;
        Wed, 06 Aug 2025 04:10:20 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f35:8a00:42f7:2657:34cc:a51f? (p200300d82f358a0042f7265734cca51f.dip0.t-ipconnect.de. [2003:d8:2f35:8a00:42f7:2657:34cc:a51f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e5862be7sm48237635e9.15.2025.08.06.04.10.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 04:10:20 -0700 (PDT)
Message-ID: <92ebd740-2dec-4531-ae91-0591eaaf6281@redhat.com>
Date: Wed, 6 Aug 2025 13:10:18 +0200
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
Subject: [Invitation] bi-weekly guest_memfd upstream call on 2025-08-07
Autocrypt: addr=david@redhat.com; keydata=
 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
 g3eXuA==
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zlJbqPQxzKim0uNvcHet47gMqPGvPHpf6RW6wn_9iDI_1754478623
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi everybody,

Our next guest_memfd upstream call is scheduled for tomorrow, Thursday, 
2025-08-07 at 8:00 - 9:00am (GMT-07:00) Pacific Time - Vancouver.

We'll be using the following Google meet:
http://meet.google.com/wxp-wtju-jzw

The meeting notes can be found at [1], where we also link recordings and
collect current guest_memfd upstream proposals. If you want an google
calendar invitation that also covers all future meetings, just write me
a mail.

For now, it looks like we will be covering in this meeting:
* Using VM_PFNMAP for guest_memfd HugeTLB support
* More on memory failure handling

To put something to discuss onto the agenda, reply to this mail or add
them to the "Topics/questions for next meeting(s)" section in the
meeting notes as a comment.

Cheers,

David

[1]
https://docs.google.com/document/d/1M6766BzdY1Lhk7LiR5IqVR8B8mG3cr-cxTxOrAosPOk/edit?usp=sharing

