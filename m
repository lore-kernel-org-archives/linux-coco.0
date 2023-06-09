Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE4463D5
	for <linux-coco@lists.linux.dev>; Fri,  9 Jun 2023 07:05:37 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1b02085bf8dso3855955ad.0
        for <linux-coco@lists.linux.dev>; Fri, 09 Jun 2023 00:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686294336; x=1688886336;
        h=content-transfer-encoding:from:to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bIkL3j1SUti+mxRknWXsGzjEHfZ++LfAOrCAj6OvBfk=;
        b=iu1oGrYK0n9RRytKgRWuq+/y3owYxXRCdZM6NAYvKaIlvdv+nFWF18hcYggkqs6ANG
         BAl7LGAJHY8vokHVQq3rL9VjfUZXuW9JRO7j9Gq2vMZXnamcah+XYFAIQXrfNON6FGae
         ATHfXenOKwdDgiHVPUF7/q886SJ36bNdD3lzOcdIR/JygW6z2gZGnCDXFgyca66d6kZo
         DjttXHNP8ePwzOrm0je4dvrE66aZyvW+hV4mfuCpRYhArCgIunEUf4ck+/AF9UL5NYZG
         6BbuBD9sciHIfj0I3TvRhPa9GJzQaR8D/ofQWYiwfDGV+KmMW6rbV0krQqa52LPJomSi
         b7hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686294336; x=1688886336;
        h=content-transfer-encoding:from:to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bIkL3j1SUti+mxRknWXsGzjEHfZ++LfAOrCAj6OvBfk=;
        b=KhB6J8xTfRfJUG++/weDVZBqEhBJusu6CfFmtB8vOLoYcvWbQuDtgGXiE6I+x4tI4+
         7Ws3cWDirUsgJJ0N+lYskMMMZN6dkaq58Fgkm4+fi1i68tg0ZWmk81Gi6FCeVz32lQt9
         Zji9X6rMbUmXBghzRB+Z0Wuwi6MAMCmI5ENVm9mcUe4nxiIVcV+NLNhHB2Tc3DBS0gV0
         OB2fP/Jt6ifkK4G7cMtP0oF1EHwfRpirwz/EMjNQdgE3A5ZWSUnieRf9uf1CbPiMMtTf
         DBZPRnILGrTE9cO5EHKQEyVq4v9v3AKuX/IENi+GYtwT6N/os+ZT67kwIeH8QOl3Jq78
         4Rog==
X-Gm-Message-State: AC+VfDynIb7U50P3ykJ7yt9SCYG453JFdjRQgxXyASyB3hoc4T/+fgbY
	/SjnLIFzc1ANKa70Te0OakI/v5tp+n727YT8N7w=
X-Google-Smtp-Source: ACHHUZ5fAlpc0RsTo6zoWuVdqwi4SI6ESKlgg2jy5CLE4vXWR0wYDIsxd1KJk44F0xNXf4VtESFV1A==
X-Received: by 2002:a17:903:22cd:b0:1ae:4ee3:e3e6 with SMTP id y13-20020a17090322cd00b001ae4ee3e3e6mr351532plg.32.1686294336055;
        Fri, 09 Jun 2023 00:05:36 -0700 (PDT)
Received: from [127.0.0.1] ([8.218.195.28])
        by smtp.gmail.com with ESMTPSA id w17-20020a170902e89100b001ab39cd885esm2497665plg.212.2023.06.09.00.05.34
        for <linux-coco@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jun 2023 00:05:35 -0700 (PDT)
Message-ID: <277db590-ed69-14c3-ce38-d6df45e446fb@gmail.com>
Date: Fri, 9 Jun 2023 15:05:32 +0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
To: linux-coco@lists.linux.dev
From: Guorui Yu <yuguorui96@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

subscribe

