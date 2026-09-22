Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADB2541457
	for <linux-coco@lists.linux.dev>; Tue, 22 Sep 2026 15:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790092786; cv=none; b=Kp5qgUIMs4onUxbuOPcdcGY+p7cOc4+wrD3t2UUJIMxx6n0S1tgyOb1zhqJhtPAiOt4E1cPujQZzDhoilUSOJT5U5kI0wgeOhn+iwUw5fsf5b8l1nESMW/EXh3DX76PsH0ZH5ElVvMG62Oe/BECzvbjr7Ffe3Z+NqRVO9lFbFsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790092786; c=relaxed/simple;
	bh=E8MOFpzbt1QnCvl7PyBeS49aMyS3+spMzp0KDWR4X+E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=fRyemC16TniD03QHIHUqUVeCM95CkQWM6yJqqgMieUxTqLDOYcnHz3tKRdl+ts2fyI/B+OkZRqVV4IWbtvHod+F/2/4pL5eLBhYes81qjiPW0bTEyu9Ypp3h/4lSLC7lFA5wRJKDL+4upI8Iw9DHKAZ3MsTtNWXBzFRWk7sK6hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J9ix/4yQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J9ix/4yQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790092783;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vnzxIkFjO/uws6giHzZ1s0Tl8JvX28Ubm/U0YTfgZHA=;
	b=J9ix/4yQlD6KTVA/wau64kh3+jopjg+lVjMm1Ai5qXn67XZeZibEaFX30mhoPTO5jx9ID1
	nvDCvy8HlLxFc2QM4/rSFzNlv1e2YGrAeb1qB49xXqRCtt4KXEFIl4dI0EbyvB/7GzQdf2
	74+P+a3uhmrzKYEtd5N7rVjpKXPVUao=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-104-7wWOQ-H0PU2TafVAa_gFHg-1; Tue, 22 Sep 2026 11:59:42 -0400
X-MC-Unique: 7wWOQ-H0PU2TafVAa_gFHg-1
X-Mimecast-MFC-AGG-ID: 7wWOQ-H0PU2TafVAa_gFHg_1790092781
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4ac5feaa4so148966a12.1
        for <linux-coco@lists.linux.dev>; Tue, 22 Sep 2026 08:59:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092781; x=1790697581;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vnzxIkFjO/uws6giHzZ1s0Tl8JvX28Ubm/U0YTfgZHA=;
        b=YDh14gbb81B29k3Jnk31hjp/d8dzTr6vPRPF4WICp6u2uh0U9nWXj5dJ+Pp5+mw1JN
         3waXgVhwQR8k8L1038VGuQyNMzdcl4YYrxtMiyW4etVPK68KiP7mtARBC/gyuKEl9tyT
         HGbxXCLzdv6/+91xS68VUBpdYE29bSawRgDSaT73aw82dgQoXWFw2NIGBXaQaYf7v6KO
         UxqOA3/P7JFqcWxfTV/M4XwCJHXtkxifI1Qq86iFbawi8R9hAVjlfW75Hni9CaBt2UHW
         7iQAszq49jInwuZXCwsrA1SOEscRf+W4gUCEUpUPtDgzckfCjGgWJV2bsW6NKOczBvpt
         uqIg==
X-Forwarded-Encrypted: i=1; AKwUvBzyVtyPJSfxIbDhLl8JopI07lLWaiM6eRxCK4KzIClnonpucKrNZdhNz0USDN8Y08KlT+ZEDImlIY+T@lists.linux.dev
X-Gm-Message-State: AFuF++kUJxdyPAD+S/UIdITlPEf3/sLl0ZFt8whZAvHJdMGXK/Y2YkFo
	uUwA+kXJiCG3T8k+M7ldoVbLtTNEQ1Ho0BtsOZ0yG80iRLVKh4Z2hI7aJ3Sap4op2SUudoJ76dj
	nSZnKD4PhfFJr/JlXQre7PfjucymWgKw8GkJNxLH/cgHt5cDp/ac09zX9N6nG0nyydfXrO6x/bS
	5CgnRQzpAhyVEvLCP/cdwet32yINekKvHoO+rJI6hsiU1h+A==
X-Gm-Gg: AYBFou2tc3YNf+ryQo5W5rmpnKnmB6e0m3sRNqTf93ew4zJ9e7nYQEJAUr3k1ahtPMG
	Mxpdxk2nBn/mabM6zO2i06bZJHNz2yLFFHKZkc2XV03gNSXb6u7CuDgZ9aujKCMwERTNVkqLZIc
	spsRCjnIsNe4E2gwfuVST/8BfOBqOC+QVaFlSRMqW8W9xGe4z0ZNUNKTzD
X-Received: by 2002:a05:6a20:d526:b0:3dd:85a8:4c66 with SMTP id adf61e73a8af0-3ddec802477mr2206225637.45.1790092781076;
        Tue, 22 Sep 2026 08:59:41 -0700 (PDT)
X-Received: by 2002:a05:6a20:d526:b0:3dd:85a8:4c66 with SMTP id
 adf61e73a8af0-3ddec802477mr2206192637.45.1790092780548; Tue, 22 Sep 2026
 08:59:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <aqlXypyTlhuLRVmD@8bytes.org>
In-Reply-To: <aqlXypyTlhuLRVmD@8bytes.org>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Tue, 22 Sep 2026 17:59:28 +0200
X-Gm-Features: AcwNN1UzOxzA_QV00w6WlKEqf_x9wUBx7h1CvyARLQDIWsvRBVgvTGxmza6xyLw
Message-ID: <CAGxU2F4VaSUGe7QkhqCm2=AzcYxzZqgxm+yjk=QTRkUTxq_3Ew@mail.gmail.com>
Subject: SVSM Development Call September 23rd, 2026
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TbUGWXp17q8kCEFNf-uvYVDVYKPclLlXZHihX2LgjDk_1790092781
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

Here is the call for agenda items for this weeks SVSM development call.  Please
send any agenda items you have in mind as a reply to this email or raise them
in the meeting.

We will use the LF Zoom instance. Details of the meeting  can be found in our
governance repository at:

        https://github.com/coconut-svsm/governance

The link to the COCONUT-SVSM calendar is:

        https://zoom-lfx.platform.linuxfoundation.org/meetings/coconut-svsm?view=week

The meeting will be recorded and the recording eventually published.

Ciao,
Stefano

