Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AEFE33DA
	for <linux-coco@lists.linux.dev>; Tue, 11 Oct 2022 13:59:47 +0000 (UTC)
Received: by mail-ua1-f47.google.com with SMTP id y20so5040767uao.8
        for <linux-coco@lists.linux.dev>; Tue, 11 Oct 2022 06:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eclypsium.com; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=v6drQhY3nPk+J+jL6R0RRWMe98UOtt8MgKXuLgaogHQ=;
        b=J8uzcxFLSXNniRGJX1OHG85BNxdn7N43eaYV8OINhZmcwmg99g1/8O/0j8DztCzzh7
         8mUsw4r6kYW0fOXDASRhILZpxrd4uXmXUSIchBp3H6dUJ8bH+lp9czsqQDm5RJBHG7Cj
         cdXpjLL6iEQezSLoBUvpnHQYgYCxKbIEZYx4gmLWx5cp7MwJqgxSDVWchrOuarl+g/U0
         B9eOBl8AIS+Y3BJfBItTVq0rM8LpJ79CB3WgS2DRQoMLwWJHNAwdOn0+pyUGACqbEjGc
         2MF+px2Mi39srHOiTkshRT0OJzE+aejlqB/v1uhf/1B5d3gzJGcecE8fBhk46IqjZU9K
         ld1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v6drQhY3nPk+J+jL6R0RRWMe98UOtt8MgKXuLgaogHQ=;
        b=M/renYPTE+IE2wYd5uK//hhjWC+JZg3SYRkS+BWGX7Ir9vc8COGTxQRTTb/w7ywHra
         K/Mc6OLpvZE7kCWwUgaqNv/pZKmq/2N3isGBFoeHNAiSOQmwcKqPzcy2OXisgHaPqRQO
         zYSsla/wI2PWfAos0Oue3LE0UokVR5cBZWtaDWnygmhaAlteYgWuCKY1cmZoGCj9C9dG
         pa7e/WWGz8Ky5c6B9evMHHaeeLo4+REgflWqB4zsLfO0VHSGBrOpZrTtRpnYylsZ6yg4
         TyxtShfFbfMM4kKWNl17enQb1lVoO6U6ZjktSAxtb+FW9XhcOmGvw6a4hvsQ2QfDnXSK
         7zng==
X-Gm-Message-State: ACrzQf0s0KlAmUnxuFaNHoQPGsHzcjq0FcTehZq5dmZKMSZ9HrGTmq1H
	vKc1Pq8BxxDE/en3yCIMAbQLW2Q0LqFGJ4iXp2Hk4F5H9dE=
X-Google-Smtp-Source: AMsMyM4PqIZCENOGXYuoyczcKR0rW+bBV9aUC9a9SyYy0uTuLechbM5LtebU85RUib8XVbeAE2VA796uWMYUrwuLnbM=
X-Received: by 2002:ab0:749a:0:b0:3da:d19:6272 with SMTP id
 n26-20020ab0749a000000b003da0d196272mr11459184uap.73.1665496786025; Tue, 11
 Oct 2022 06:59:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: by 2002:ab0:136f:0:b0:3d2:4916:f286 with HTTP; Tue, 11 Oct 2022
 06:59:45 -0700 (PDT)
From: Martin Fernandez <martin.fernandez@eclypsium.com>
Date: Tue, 11 Oct 2022 10:59:45 -0300
Message-ID: <CAKgze5bvqPLo7VZs8rCWc2rFsUekx_d0coKFzObi=J+_nPOacg@mail.gmail.com>
Subject: [RFC] UABI to show system memory encryption
To: linux-coco@lists.linux.dev, linux-mm@kvack.org
Cc: rppt@kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, 
	Borislav Petkov <bp@alien8.de>, hughsient@gmail.com, daniel.gutson@eclypsium.com, 
	Alex Bazhaniuk <alex.bazhaniuk@eclypsium.com>
Content-Type: text/plain; charset="UTF-8"

Hi guys,

I've been working on a patch [1] to show in sysfs the status of the
memory encryption.

One of the parts involved in reporting the status is that the platform
is capable of doing encryption. In this case I focused on x86 EFI
systems, where this is reported as a flag in the EFI memory map:
EFI_MEMORY_CPU_CRYPTO.

From the UEFI spec:

  The memory region is capable of being protected with CPU's
capabilities if and only if the flag is set.

After some discussion we decided that it would be nice to show if this
flag is set per memory node, ie, add a new file in the nodeX directory
where it will have a 1 if all the memory in that node is able to do
encryption (has the flag for x86 EFI systems) or 0 otherwise.

The idea is to determine, in conjunction with checking that the CPU is
actually able to do encryption (checking that TME/MKTME is enabled for
example), that a system is actively encryption its memory. Currently
fwupd is looking for something like this, in order to do some security
checks at boot time (more details on the use case on [1]).

More discussion on [2].

Please provide feedback on how this could be improved or new use cases
that could come up.

Thank you.

Martin.


[1] https://lore.kernel.org/linux-efi/20220704135833.1496303-1-martin.fernandez@eclypsium.com/

[2] https://lore.kernel.org/all/20200618210215.23602-1-daniel.gutson@eclypsium.com/
