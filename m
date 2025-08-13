Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA842046BA
	for <linux-coco@lists.linux.dev>; Wed, 13 Aug 2025 22:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755122585; cv=none; b=qpb68bUydrnMy0OP1msGX8Qoc8bFy45sFsOStkZbU7WvvKQI6J3bxKy2xijJhV9BYx+YSI9KQRoJkLiw1sI7LQ3eeAZQd1HxPh98gtb9hvIxqQx7mnlis4pwUM7tRXx55HWQXQPGvB0Spw/tQ21ToyrkHl7wD3Tfbip62finLys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755122585; c=relaxed/simple;
	bh=Wmn6DsHQTNdV0xZRNI3J0H9OLIo2yMWrmbkWA36FagA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=iJGikynS6x7vNBtmOvfH+gHonLmgVCashxw4tsyJwP5JjpU247aN3nMvg+fuL05qEdcKQam+tc/+Ttevo7gonFZW7EuzAgsqNb6HQyLLBqDeKzVU9ILG/vP0AcSb0f2dS6hz7BUbRJEKaCYFLbr0BnkQg8DaPFvtO0j8IewGJ0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qD7HyU4q; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qD7HyU4q"
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-50f8ba4d2f2so126574137.3
        for <linux-coco@lists.linux.dev>; Wed, 13 Aug 2025 15:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755122583; x=1755727383; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Wmn6DsHQTNdV0xZRNI3J0H9OLIo2yMWrmbkWA36FagA=;
        b=qD7HyU4qZMs3hukGHcI9zBskJ8QuEKdR3b09hEyxzvtdrry4X3vgf6CAQsQZ/ihnr7
         CyEtlZr+KuO0K/rEQHKKHZwJ3QlkD3hUYwEGALIaiXdlTETF8RtC2NIQVNIQMiIfcGNL
         7/vFKJ73IubO3pvQsvrRHJlCxISxWnHJqBYba9baWHwk0F2OJwyfxYK4oJamu8YjGvsO
         98tD88cfJanlhbK2+HwhReRwFFaN5RgzoEZy7kl8TbSOjLjiN3b53DQ/NjsfVSkkO+B/
         vKYI5qOJhE+JejTwj7u6paHMnUhldmyR8FpXbYkL5LJWUXT1m6g7BIIwvya5gUMwOuRs
         a43A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755122583; x=1755727383;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wmn6DsHQTNdV0xZRNI3J0H9OLIo2yMWrmbkWA36FagA=;
        b=O5K9ojsMf2+8Di4NukciXQviJNRXRHvKkWoFkHZZPbR+IXeGHkbxXhGW6DcLHDUJJU
         /O/v3Ce1ND+uF9eQ6BxHDZS7ULrAeo74ZTIPrt1oQESMYT9zeqYrTwMan0tIVc2ZpSae
         aBY1lbqx4hT1mWglwKvYBFoPnSuV3Bps2StvB2yoCLaM0Lld4OIJThmmDD91FvpfUhF2
         74WAEgBArc24I3PMGPgIskjJ5jQCrFbc9lq5/+ffiEj6PnHGU7oGKrjrC0zRjx1cT7oa
         FsbTjQiS8xvGYoGJGZqiyo9rL8yJDkXo1+h4KIvBn8SplxnB+MGTzHSR9T2kPS5PVxm9
         KSkA==
X-Gm-Message-State: AOJu0YwukaEw6q729apTrnLK7lKjJ3x+NTalH3LeCvykETyQBu01rhrB
	eaDk5soRs6EwsFFcGGln4YOG3cB91ulsP2OzfijetddYKCrH7bhWNwtu0KkBd4U2rlH2hDP8J+F
	MlwelNPp6mBBS7WChdMI5WREo0UVLklErclE8i59xNM/jzSGkSZpxdEow
X-Gm-Gg: ASbGncsGzjNbt8aTKoaFhMQoDgHJktM23+ZRN9JwMTcXZg00iY+UT9fdvdZGaBDflaz
	mQadWOIgjkpdzmwaoSI7i/QadfUN6mbQxKjd2iO7At5qJqOcB7qbeFWeJdOaj7PXhksJpN8z87g
	AwVCFrLe0u+kmlYSyUZ4yBpNz4RWARM/ZPftyBGdFr9d6xIJCwRVWKc+LMRp2EMKlrk0BPOtGU2
	3eOuewpLii6n/p3D4n/NilG9a9wmAmsxbw2Zg==
X-Google-Smtp-Source: AGHT+IHOPZTebPBXZQ3VaHsRl9NVDhCJhW5Liuwt5InxYC482PY+s9C/MBh2eNUkYZWCUfOSt2NIPumWvKUx9nKAOZs=
X-Received: by 2002:a05:6102:3e22:b0:4c3:64bd:93ba with SMTP id
 ada2fe7eead31-50fe010b6cbmr418983137.11.1755122582285; Wed, 13 Aug 2025
 15:03:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Steve Rutherford <srutherford@google.com>
Date: Wed, 13 Aug 2025 15:02:26 -0700
X-Gm-Features: Ac12FXx4Aqy9cKGyAiUV8lnMuXv7igu2pqEyXPyOKYuwxfNA0NtfPa58wk2Txmc
Message-ID: <CABayD+f8k_+sq2wzYHaS8=PZUG9_EqUmZyg9mNDZ4Q5gSAuxEQ@mail.gmail.com>
Subject: [Cancelled] CCC Kernel SIG Cancelled August 14th
To: linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi all,

Cancelling this month's instance of the CCC Kernel SIG due to lack of agenda.

Dan's VFIO/IOMMUFD huddle is still on at 8PM PDT.

Thanks,
Steve
