Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B672F24
	for <linux-coco@lists.linux.dev>; Wed, 11 Jun 2025 08:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749628897; cv=none; b=a0AvrWKnLkepQ50ONTfTyv0AZRreGNLeqYxkPj52YhoYV85vYG0YTVvnuBmDTFIkVjmgk0HGU3Rm/ws9pYx+l8/JxtULRL5JlVSvR5tVypAzMrqe1c6bJiQotVm6PiohS2fIsMH9aKpzZWUVhVDKMVr3LItKpzkyX6IRNhfoOIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749628897; c=relaxed/simple;
	bh=VMuDruAiSYd6fyR+YcVGFPxG9EqdOLs9uS5rJI5cgFM=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Content-Type; b=A5oI6jYvczOD3ym9aX0J8bRZnBge+ZZpQ1ytMy/m2hlYgC6+UGPgCy7akGruMSWEZ3vroew9QMQR+Hpf9BJpcrNu7E7eEmyA5seFr8PfjliJddN8vZHbDuTndqeAIr6i7OvQ1dC5uy6zK8zpPdxSXqn+eCcFo2j/AJ18lg+8Oy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZiYVwfqO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZiYVwfqO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749628894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=m9FLKEWp1J37lhzQu2+pqakf8kqqb2t1/alONkzvyw0=;
	b=ZiYVwfqOHyB2MsMWEz3hlk5UVSV6NyJyiSyKGa6IeokJ11Y8F8rPkG7cmVGfoIKRFUABbg
	nnn4adW3FccIczdE7TFjQv4Gm99RkDeJ7KCI75bvhhLzxwbSV/cwlIuL76KsUKkaUWqkua
	mYZszFeq/4iETQTOr26i8pXg6+UGxSE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-335-USt68LtDOqulV3rgV448WA-1; Wed, 11 Jun 2025 04:01:32 -0400
X-MC-Unique: USt68LtDOqulV3rgV448WA-1
X-Mimecast-MFC-AGG-ID: USt68LtDOqulV3rgV448WA_1749628891
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ade5013e05cso224868066b.1
        for <linux-coco@lists.linux.dev>; Wed, 11 Jun 2025 01:01:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749628891; x=1750233691;
        h=content-transfer-encoding:organization:autocrypt:subject:to:from
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m9FLKEWp1J37lhzQu2+pqakf8kqqb2t1/alONkzvyw0=;
        b=OrokzXO7IKQJs2PYuLKWQ2qq/20TXctS8+KnRdAvfcDwlRcpAIy3geCQq6c6KBgcNR
         zPkuO669F3DCoYHVqU7KvtYmyUxvnEGfa/RrezUgGBA4GIzE0GYLkXFcG+zthYZWa4TU
         a4B58I4Qn7FeqpKWWNsR9S1vAi8yz5kVze/PsFZLos9placw2S87OxKvJHBVmu6440nm
         Cl6+gzd9Q0Dxiu/pkuvq2CFygP5jL3duGMrwvm5Nl3zMDNPw/NNIv6R+NsodJ4l5uY5D
         mWRM5gI1WQ+PrbScUem9fjBD/EzZRO2Cchp70EHtFhIQ2XgSDbrG1sMwuBhbJsl6j0B5
         EI+Q==
X-Gm-Message-State: AOJu0Yy0RH0z9Y3VyNAtyIvJsdwqzizyxuBNf9tNliasJDrGFRXlCLK1
	ZeHD/YK1nradKXFnVgMkXEMR6iPAOcn7pv3yoDGo1i7DvaU9/i4gpnjqh7+4oxNB91Qpiihb/Ig
	8H9/v5FFrfm/SH3X91j+7QNN8VSFwDaAspo/AsfaxykzKJJysNfg5N/ppKCtyco53twqJFXYkFG
	UN/+0Kq5X9Q2rPi0BIYFAJ9TChXOFmCqE901cLYzjd4poVFk9L
X-Gm-Gg: ASbGncuyxK3g7YIp8eyeMUC/EgU4Ilks/MlRAWGlR3XR2HtpN+NeQrfh9thnm9Z89Ux
	dDLzHueLrQ+en5aXRh+q7ZHipKwftyz8k0WB61pzK3TMTnNxI3TwdXwwiMnbtKIp8QGgUqbmau9
	ZzRE/HrCAavyx2X8nSZNYcuJv9QjzU5Xp9Uo3TT+K2Lxcnd6v71kgdrGYsiOHfovaJuoJrvrX5C
	my3/+ADQFsMIc30CVWF+k8/9GHkudPv4Wxl444H4pyHI/u4+9+ZtDJdvFNg9AT+YucuWkvkftQT
	bsYu6xKJB6UAFTDNg4qWOFZBW/sYJriUZZt26i8NDPMa
X-Received: by 2002:a17:907:7b9c:b0:ad8:a329:b4a9 with SMTP id a640c23a62f3a-ade894cafc3mr219309866b.25.1749628891107;
        Wed, 11 Jun 2025 01:01:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAtv7Gi0dUnDtW6KzJAOcUxrQUL2MiOAbELiLpTMNTEIOTNi7A8aS5dxZDLsEMZzQlA9iumw==
X-Received: by 2002:a17:907:7b9c:b0:ad8:a329:b4a9 with SMTP id a640c23a62f3a-ade894cafc3mr219301266b.25.1749628890289;
        Wed, 11 Jun 2025 01:01:30 -0700 (PDT)
Received: from [10.32.64.156] (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc3902csm841681866b.125.2025.06.11.01.01.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 01:01:29 -0700 (PDT)
Message-ID: <3a571412-7222-4e42-aa0b-98bcf931e1f3@redhat.com>
Date: Wed, 11 Jun 2025 10:01:28 +0200
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
Subject: [Invitation] bi-weekly guest_memfd upstream call on 2025-06-12
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 36Ij3JJlJyVF1rCfD9F3DPouHsJDGHkiHBzPHt44LYI_1749628891
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi everybody,

Our next guest_memfd upstream call is scheduled for Thursday,
2025-06-12 at 8:00 - 9:00am (GMT-07:00) Pacific Time - Vancouver.

We'll be using the following Google meet:
http://meet.google.com/wxp-wtju-jzw

The meeting notes can be found at [1], where we also link recordings and
collect current guest_memfd upstream proposals. If you want an google
calendar invitation that also covers all future meetings, just write me
a mail.

In this meeting, we'll continue our discussion on preparedness tracking 
vs. large folios, and talk about next steps for in-place conversion 
("stage-2") and whatever comes up around that :)

To put something to discuss onto the agenda, reply to this mail or add
them to the "Topics/questions for next meeting(s)" section in the
meeting notes as a comment.

Cheers,

David

[1]
https://docs.google.com/document/d/1M6766BzdY1Lhk7LiR5IqVR8B8mG3cr-cxTxOrAosPOk/edit?usp=sharing

