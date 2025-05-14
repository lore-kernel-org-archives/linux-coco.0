Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A33270ED7
	for <linux-coco@lists.linux.dev>; Wed, 14 May 2025 13:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747228369; cv=none; b=MrCFSw1maAtN6Dnc9tefQHKGCErZSgky5z9PlOwx/yPYNXPVkPvhC01PPUoptYwdqTEpu+9GNVpj3/19+g8vi4qhxMkYcGWDDH6IeqrKSfZ33UNKvpgA/bcXqMslGXrIgG8AKpvKY2b52kI8OaKpngks5jm1Fl/P59lJXfNoeQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747228369; c=relaxed/simple;
	bh=sLEdMEdMovKS3zpqUtFGTwiPl90m4zOZfD2cF5JdVW0=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Content-Type; b=DclA+yiXk8JuiaX9bl/BIFKPqwp94GrFT6OwF0OPygGaN8zLizWKCXI1JAiDXXWyX+T3QpiugQZrkY5zPYdJobvg7k7HHXlNnTQ4NdtqNnPZUQjXU+HMXQ0qc8Kobdo7CX3xfI3DpW3uyi3i3h0TbQVu8umQqLjyWR7nJC4wOIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gvOKqRFJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gvOKqRFJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747228366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=EdIn2yyAz7EZhD/dsm/ptbslr99u2EeR1xi+jasFHE4=;
	b=gvOKqRFJhnrabuQK7rDZf6wRBJKW+8E4NvQr4J+RuKSQWQ1vZ11iO52kk6egeg9r6DwZba
	8nX+m4TsPvgwu1qyK7WpvXAim2/PyfivXnJxszaTbTrm1CYPYnsQcMoiKfERE1qHOzkBU8
	J0/gL+jnaH6wA+AHGMIG8HKEqiGQSg0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-402-rNUoEyjzMh2mnqahUP5iRg-1; Wed, 14 May 2025 09:12:40 -0400
X-MC-Unique: rNUoEyjzMh2mnqahUP5iRg-1
X-Mimecast-MFC-AGG-ID: rNUoEyjzMh2mnqahUP5iRg_1747228360
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43e9b0fd00cso4889185e9.0
        for <linux-coco@lists.linux.dev>; Wed, 14 May 2025 06:12:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747228359; x=1747833159;
        h=content-transfer-encoding:organization:autocrypt:subject:to:from
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EdIn2yyAz7EZhD/dsm/ptbslr99u2EeR1xi+jasFHE4=;
        b=b4cO34YkCdDwN4Gq/nODq0KoLR44dHhHK5fwVTK09yiDa68OIH8B7eq3CvCH9H81oL
         IPf7ilPJYE3p9r/1LblrNCi7DD9fXSdvCVjPQNksp7Xq/MAz0xJPKARyESB2k0Uf1zxX
         NY9WEnk5zrGwYahW4ex26JdFCmCGr/LdsuPYRGf+m0x05UmfBwYeMAAZlEtuV9sVJI0a
         ERXv74xS451ssZ3oj4+up5pzzhkKVhXx4G5hcU7YsYKTrK2baznv/MbYrSVhxI3PIJ9U
         ShAcX/3Fn+tznS0qasaCCbgqmZGSreXRvz9VIiWyJCdzEG7anrrWKuSep8wwJkkKhHAr
         SsOQ==
X-Gm-Message-State: AOJu0Yx0IKUKr1wRh/x6/XIsMfD7kc/IK30S1wZP7lWc1GM7B5oI2vOM
	OUf82+Brbrxf7szXGMAeBTvDBQNpI/yQQiLF/NWcWQ0G1fkY4b7A3fKACnQSTPsxIbZIP5VmGly
	oizbtS7RanWgqjeCPIj6+/1EXo09EfGqRnuRWo8oPZ3/w2LvYSvp8hMNeHVrg8lPahSPRIslh/7
	eTkII+xg4/qb9POFDEldwUkEw8yCCJV9c2VEo4FVpa4Tgw
X-Gm-Gg: ASbGncvo7jvCQ+rfYEwnDSqfT3RsVHqILviyTts7+/2YiyHT8hcAbcyVH0pz4fhKYCI
	8vqluaOch5XXRueb6EMFe3SEFNxOskErJ304CiJOXNQR8py4NjnuuNhR7H8c5bZM2GIedUviR4X
	zRopB7qnKWv1e81uwHHtSlxcO7GBGrl/4YfZdcAk0/HexLO6MFEn2vVhYhKNVPHRiKCvgs0xKbf
	e2sJbUzUkIev0YU7BsEGkS3sCec8kkxmrXDHfjrJPIzaW/ec5tVn+RfvpXXvgxXpSfmW8wOyXxo
	tzAKKJnCxfS/W4e5pGRL24flx3b4/W7GFXfYR3e4lvH3A34FzUVIzFM7df/I0MsV5gKUJZ40MFk
	aKnuTKYHNmGzLpyKn8onmClMVvDupqCKA4IwqmBE=
X-Received: by 2002:a05:600c:4e08:b0:43d:186d:a4bf with SMTP id 5b1f17b1804b1-442f18da6femr28793985e9.0.1747228359363;
        Wed, 14 May 2025 06:12:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9BSS+xn8R8muh0thlFOz6bE90p9V4OXgJI5ArM8SAAuE7j+EXWbkKzPWNgP2QhbJUwAxUsQ==
X-Received: by 2002:a05:600c:4e08:b0:43d:186d:a4bf with SMTP id 5b1f17b1804b1-442f18da6femr28793285e9.0.1747228358646;
        Wed, 14 May 2025 06:12:38 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f15:6200:d485:1bcd:d708:f5df? (p200300d82f156200d4851bcdd708f5df.dip0.t-ipconnect.de. [2003:d8:2f15:6200:d485:1bcd:d708:f5df])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442ebd46aa4sm41276365e9.1.2025.05.14.06.12.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 06:12:38 -0700 (PDT)
Message-ID: <ac1f220d-5a3b-418a-bb99-5a8193c89322@redhat.com>
Date: Wed, 14 May 2025 15:12:36 +0200
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
Subject: [Invitation] bi-weekly guest_memfd upstream call on 2025-05-15
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OdNMpikR_qCHurKW5LpsMkekJzFZ_XfvJ1m6w-_QUcQ_1747228360
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi everybody,

sorry for the late reply, there is a lot going on on my end.

Our next guest_memfd upstream call is scheduled for Thursday,
2025-05-15 at 8:00 - 9:00am (GMT-07:00) Pacific Time - Vancouver.

We'll be using the following Google meet:
http://meet.google.com/wxp-wtju-jzw

The meeting notes can be found at [1], where we also link recordings and
collect current guest_memfd upstream proposals. If you want an google
calendar invitation that also covers all future meetings, just write me
a mail.

We'll continue our discussion from last time on how to move forward with
mmap() support ("stage 1"), discussing any open questions around the 
latest upstream posting from yesterday that might have popped up [2], 
and will probably talk about related follow-up items that are based on 
this work.

To put something to discuss onto the agenda, reply to this mail or add
them to the "Topics/questions for next meeting(s)" section in the
meeting notes as a comment.

[1]
https://docs.google.com/document/d/1M6766BzdY1Lhk7LiR5IqVR8B8mG3cr-cxTxOrAosPOk/edit?usp=sharing
[2] https://lkml.kernel.org/r/20250513163438.3942405-1-tabba@google.com

-- 
Cheers,

David / dhildenb

